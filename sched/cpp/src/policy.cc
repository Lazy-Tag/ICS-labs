#include "policy.h"
#include <map>
#include <cmath>
#include <set>

using namespace std;

#define MLFQMaxPriority 10
#define rate 0.58
#define power 0.86
#define Time 1
#define ioRate 0.01

struct Key {
    int mlfq = MLFQMaxPriority, d;
	double value;
    Key(int a, int d, int p, int m = MLFQMaxPriority) :  d(d), mlfq(m) {
		value = (d - a) * pow(exp(p? rate : 1 - rate), power);
	}
    bool operator< (const Key& key) const {
        if (mlfq == key.mlfq && value == key.value)
            return d < key.d;
		if (mlfq == key.mlfq)
        	return value < key.value;
		return mlfq > key.mlfq;
    }
};

map<Key, Event::Task> CPUQueue;
map<Key, Event::Task> IOQueue;
set<int> IOTime;

int lastTask = 0;
int now = -1, cnt;
int lastIO = 0;

int avgIOTime() {
    int r = IOTime.size() * ioRate, cnt = 0;
    for (int it : IOTime) {
        if (cnt >= r)
            return it;
        cnt ++ ;
    }
}


Action policy(const std::vector<Event>& events, int current_cpu,
              int current_io) {

    bool flag = false, hasFinished = false;
    for (const auto& event : events) {
        int type = (int) event.type;
        auto task = event.task;
        auto time = event.time;
        if(type == 0) {
            now = time;
            flag = true;
            cnt ++ ;
        }
        else if(type == 1)
            CPUQueue.insert({Key(task.arrivalTime, task.deadline, (int)task.priority), task});
        else if(type == 2) {
            for (auto item : CPUQueue) {
                if(item.second.taskId == task.taskId) {
                    CPUQueue.erase(item.first);
                    break;
                }
            }
            hasFinished = true;
        }
        else if(type == 3) {
            for (const auto item : CPUQueue) {
                if(item.second.taskId == task.taskId) {
					IOQueue.insert(item);
                    CPUQueue.erase(item.first);
                    break;
                }
            }
            hasFinished = true;
        }
        else if(type == 4) {
            for (auto item : IOQueue) {
                if(item.second.taskId == task.taskId) {
					CPUQueue.insert(item);
                    IOQueue.erase(item.first);
                    break;
                }
            }
        }
    }

    Action choice = {current_cpu, current_io};

    if(current_io == 0 && !IOQueue.empty()) {
        auto nextIO = IOQueue.begin();
        for ( ;nextIO != IOQueue.end(); nextIO ++ ) {
            if(nextIO->second.deadline - avgIOTime() > now)
                break;
        }
        if(nextIO == IOQueue.end())
            nextIO = IOQueue.begin();
        choice.ioTask = nextIO->second.taskId;
        IOTime.insert(now - lastIO);
        lastIO = now;
    }

    if (cnt % Time == 0 || hasFinished) {
        auto nextCPU = CPUQueue.begin();
        for (; nextCPU != CPUQueue.end(); nextCPU++) {
            if (nextCPU->second.deadline > now)
                break;
        }
        if (nextCPU == CPUQueue.end())
            nextCPU = CPUQueue.begin();
        choice.cpuTask = nextCPU->second.taskId;

        if (flag && lastTask && lastTask == current_cpu) {
            for (const auto &item: CPUQueue) {
                if (item.second.taskId == current_cpu) {
                    CPUQueue.erase(item.first);
                    auto task = make_pair(item.first, item.second);
                    if (task.first.mlfq > 0)
                        task.first.mlfq--;
                    CPUQueue.insert(task);
                    break;
                }
            }
        }

        if (flag && nextCPU != CPUQueue.end())
            lastTask = nextCPU->second.taskId;
    }

    return choice;
}