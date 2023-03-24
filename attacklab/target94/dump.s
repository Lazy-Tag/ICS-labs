
./rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bc8 <_init>:
  400bc8:	48 83 ec 08          	sub    $0x8,%rsp
  400bcc:	48 8b 05 25 44 20 00 	mov    0x204425(%rip),%rax        # 604ff8 <__gmon_start__>
  400bd3:	48 85 c0             	test   %rax,%rax
  400bd6:	74 05                	je     400bdd <_init+0x15>
  400bd8:	e8 33 01 00 00       	callq  400d10 <__gmon_start__@plt>
  400bdd:	48 83 c4 08          	add    $0x8,%rsp
  400be1:	c3                   	retq   

Disassembly of section .plt:

0000000000400bf0 <.plt>:
  400bf0:	ff 35 12 44 20 00    	pushq  0x204412(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bf6:	ff 25 14 44 20 00    	jmpq   *0x204414(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bfc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c00 <strcasecmp@plt>:
  400c00:	ff 25 12 44 20 00    	jmpq   *0x204412(%rip)        # 605018 <strcasecmp@GLIBC_2.2.5>
  400c06:	68 00 00 00 00       	pushq  $0x0
  400c0b:	e9 e0 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c10 <__errno_location@plt>:
  400c10:	ff 25 0a 44 20 00    	jmpq   *0x20440a(%rip)        # 605020 <__errno_location@GLIBC_2.2.5>
  400c16:	68 01 00 00 00       	pushq  $0x1
  400c1b:	e9 d0 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c20 <srandom@plt>:
  400c20:	ff 25 02 44 20 00    	jmpq   *0x204402(%rip)        # 605028 <srandom@GLIBC_2.2.5>
  400c26:	68 02 00 00 00       	pushq  $0x2
  400c2b:	e9 c0 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c30 <strncmp@plt>:
  400c30:	ff 25 fa 43 20 00    	jmpq   *0x2043fa(%rip)        # 605030 <strncmp@GLIBC_2.2.5>
  400c36:	68 03 00 00 00       	pushq  $0x3
  400c3b:	e9 b0 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c40 <strcpy@plt>:
  400c40:	ff 25 f2 43 20 00    	jmpq   *0x2043f2(%rip)        # 605038 <strcpy@GLIBC_2.2.5>
  400c46:	68 04 00 00 00       	pushq  $0x4
  400c4b:	e9 a0 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c50 <puts@plt>:
  400c50:	ff 25 ea 43 20 00    	jmpq   *0x2043ea(%rip)        # 605040 <puts@GLIBC_2.2.5>
  400c56:	68 05 00 00 00       	pushq  $0x5
  400c5b:	e9 90 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c60 <write@plt>:
  400c60:	ff 25 e2 43 20 00    	jmpq   *0x2043e2(%rip)        # 605048 <write@GLIBC_2.2.5>
  400c66:	68 06 00 00 00       	pushq  $0x6
  400c6b:	e9 80 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c70 <mmap@plt>:
  400c70:	ff 25 da 43 20 00    	jmpq   *0x2043da(%rip)        # 605050 <mmap@GLIBC_2.2.5>
  400c76:	68 07 00 00 00       	pushq  $0x7
  400c7b:	e9 70 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c80 <printf@plt>:
  400c80:	ff 25 d2 43 20 00    	jmpq   *0x2043d2(%rip)        # 605058 <printf@GLIBC_2.2.5>
  400c86:	68 08 00 00 00       	pushq  $0x8
  400c8b:	e9 60 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400c90 <memset@plt>:
  400c90:	ff 25 ca 43 20 00    	jmpq   *0x2043ca(%rip)        # 605060 <memset@GLIBC_2.2.5>
  400c96:	68 09 00 00 00       	pushq  $0x9
  400c9b:	e9 50 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400ca0 <alarm@plt>:
  400ca0:	ff 25 c2 43 20 00    	jmpq   *0x2043c2(%rip)        # 605068 <alarm@GLIBC_2.2.5>
  400ca6:	68 0a 00 00 00       	pushq  $0xa
  400cab:	e9 40 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400cb0 <close@plt>:
  400cb0:	ff 25 ba 43 20 00    	jmpq   *0x2043ba(%rip)        # 605070 <close@GLIBC_2.2.5>
  400cb6:	68 0b 00 00 00       	pushq  $0xb
  400cbb:	e9 30 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400cc0 <read@plt>:
  400cc0:	ff 25 b2 43 20 00    	jmpq   *0x2043b2(%rip)        # 605078 <read@GLIBC_2.2.5>
  400cc6:	68 0c 00 00 00       	pushq  $0xc
  400ccb:	e9 20 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400cd0 <__libc_start_main@plt>:
  400cd0:	ff 25 aa 43 20 00    	jmpq   *0x2043aa(%rip)        # 605080 <__libc_start_main@GLIBC_2.2.5>
  400cd6:	68 0d 00 00 00       	pushq  $0xd
  400cdb:	e9 10 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400ce0 <signal@plt>:
  400ce0:	ff 25 a2 43 20 00    	jmpq   *0x2043a2(%rip)        # 605088 <signal@GLIBC_2.2.5>
  400ce6:	68 0e 00 00 00       	pushq  $0xe
  400ceb:	e9 00 ff ff ff       	jmpq   400bf0 <.plt>

0000000000400cf0 <gethostbyname@plt>:
  400cf0:	ff 25 9a 43 20 00    	jmpq   *0x20439a(%rip)        # 605090 <gethostbyname@GLIBC_2.2.5>
  400cf6:	68 0f 00 00 00       	pushq  $0xf
  400cfb:	e9 f0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d00 <fprintf@plt>:
  400d00:	ff 25 92 43 20 00    	jmpq   *0x204392(%rip)        # 605098 <fprintf@GLIBC_2.2.5>
  400d06:	68 10 00 00 00       	pushq  $0x10
  400d0b:	e9 e0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d10 <__gmon_start__@plt>:
  400d10:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 6050a0 <__gmon_start__>
  400d16:	68 11 00 00 00       	pushq  $0x11
  400d1b:	e9 d0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d20 <strtol@plt>:
  400d20:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 6050a8 <strtol@GLIBC_2.2.5>
  400d26:	68 12 00 00 00       	pushq  $0x12
  400d2b:	e9 c0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d30 <memcpy@plt>:
  400d30:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 6050b0 <memcpy@GLIBC_2.14>
  400d36:	68 13 00 00 00       	pushq  $0x13
  400d3b:	e9 b0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d40 <time@plt>:
  400d40:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 6050b8 <time@GLIBC_2.2.5>
  400d46:	68 14 00 00 00       	pushq  $0x14
  400d4b:	e9 a0 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d50 <random@plt>:
  400d50:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 6050c0 <random@GLIBC_2.2.5>
  400d56:	68 15 00 00 00       	pushq  $0x15
  400d5b:	e9 90 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d60 <_IO_getc@plt>:
  400d60:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 6050c8 <_IO_getc@GLIBC_2.2.5>
  400d66:	68 16 00 00 00       	pushq  $0x16
  400d6b:	e9 80 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d70 <__isoc99_sscanf@plt>:
  400d70:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 6050d0 <__isoc99_sscanf@GLIBC_2.7>
  400d76:	68 17 00 00 00       	pushq  $0x17
  400d7b:	e9 70 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d80 <munmap@plt>:
  400d80:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 6050d8 <munmap@GLIBC_2.2.5>
  400d86:	68 18 00 00 00       	pushq  $0x18
  400d8b:	e9 60 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400d90 <bcopy@plt>:
  400d90:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 6050e0 <bcopy@GLIBC_2.2.5>
  400d96:	68 19 00 00 00       	pushq  $0x19
  400d9b:	e9 50 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400da0 <fopen@plt>:
  400da0:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 6050e8 <fopen@GLIBC_2.2.5>
  400da6:	68 1a 00 00 00       	pushq  $0x1a
  400dab:	e9 40 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400db0 <getopt@plt>:
  400db0:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 6050f0 <getopt@GLIBC_2.2.5>
  400db6:	68 1b 00 00 00       	pushq  $0x1b
  400dbb:	e9 30 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400dc0 <strtoul@plt>:
  400dc0:	ff 25 32 43 20 00    	jmpq   *0x204332(%rip)        # 6050f8 <strtoul@GLIBC_2.2.5>
  400dc6:	68 1c 00 00 00       	pushq  $0x1c
  400dcb:	e9 20 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400dd0 <gethostname@plt>:
  400dd0:	ff 25 2a 43 20 00    	jmpq   *0x20432a(%rip)        # 605100 <gethostname@GLIBC_2.2.5>
  400dd6:	68 1d 00 00 00       	pushq  $0x1d
  400ddb:	e9 10 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400de0 <sprintf@plt>:
  400de0:	ff 25 22 43 20 00    	jmpq   *0x204322(%rip)        # 605108 <sprintf@GLIBC_2.2.5>
  400de6:	68 1e 00 00 00       	pushq  $0x1e
  400deb:	e9 00 fe ff ff       	jmpq   400bf0 <.plt>

0000000000400df0 <exit@plt>:
  400df0:	ff 25 1a 43 20 00    	jmpq   *0x20431a(%rip)        # 605110 <exit@GLIBC_2.2.5>
  400df6:	68 1f 00 00 00       	pushq  $0x1f
  400dfb:	e9 f0 fd ff ff       	jmpq   400bf0 <.plt>

0000000000400e00 <connect@plt>:
  400e00:	ff 25 12 43 20 00    	jmpq   *0x204312(%rip)        # 605118 <connect@GLIBC_2.2.5>
  400e06:	68 20 00 00 00       	pushq  $0x20
  400e0b:	e9 e0 fd ff ff       	jmpq   400bf0 <.plt>

0000000000400e10 <socket@plt>:
  400e10:	ff 25 0a 43 20 00    	jmpq   *0x20430a(%rip)        # 605120 <socket@GLIBC_2.2.5>
  400e16:	68 21 00 00 00       	pushq  $0x21
  400e1b:	e9 d0 fd ff ff       	jmpq   400bf0 <.plt>

Disassembly of section .text:

0000000000400e20 <_start>:
  400e20:	31 ed                	xor    %ebp,%ebp
  400e22:	49 89 d1             	mov    %rdx,%r9
  400e25:	5e                   	pop    %rsi
  400e26:	48 89 e2             	mov    %rsp,%rdx
  400e29:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400e2d:	50                   	push   %rax
  400e2e:	54                   	push   %rsp
  400e2f:	49 c7 c0 10 2c 40 00 	mov    $0x402c10,%r8
  400e36:	48 c7 c1 a0 2b 40 00 	mov    $0x402ba0,%rcx
  400e3d:	48 c7 c7 e0 10 40 00 	mov    $0x4010e0,%rdi
  400e44:	e8 87 fe ff ff       	callq  400cd0 <__libc_start_main@plt>
  400e49:	f4                   	hlt    
  400e4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e50 <deregister_tm_clones>:
  400e50:	b8 b7 54 60 00       	mov    $0x6054b7,%eax
  400e55:	55                   	push   %rbp
  400e56:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400e5c:	48 83 f8 0e          	cmp    $0xe,%rax
  400e60:	48 89 e5             	mov    %rsp,%rbp
  400e63:	77 02                	ja     400e67 <deregister_tm_clones+0x17>
  400e65:	5d                   	pop    %rbp
  400e66:	c3                   	retq   
  400e67:	b8 00 00 00 00       	mov    $0x0,%eax
  400e6c:	48 85 c0             	test   %rax,%rax
  400e6f:	74 f4                	je     400e65 <deregister_tm_clones+0x15>
  400e71:	5d                   	pop    %rbp
  400e72:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400e77:	ff e0                	jmpq   *%rax
  400e79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400e80 <register_tm_clones>:
  400e80:	b8 b0 54 60 00       	mov    $0x6054b0,%eax
  400e85:	55                   	push   %rbp
  400e86:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400e8c:	48 c1 f8 03          	sar    $0x3,%rax
  400e90:	48 89 e5             	mov    %rsp,%rbp
  400e93:	48 89 c2             	mov    %rax,%rdx
  400e96:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400e9a:	48 01 d0             	add    %rdx,%rax
  400e9d:	48 d1 f8             	sar    %rax
  400ea0:	75 02                	jne    400ea4 <register_tm_clones+0x24>
  400ea2:	5d                   	pop    %rbp
  400ea3:	c3                   	retq   
  400ea4:	ba 00 00 00 00       	mov    $0x0,%edx
  400ea9:	48 85 d2             	test   %rdx,%rdx
  400eac:	74 f4                	je     400ea2 <register_tm_clones+0x22>
  400eae:	5d                   	pop    %rbp
  400eaf:	48 89 c6             	mov    %rax,%rsi
  400eb2:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400eb7:	ff e2                	jmpq   *%rdx
  400eb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400ec0 <__do_global_dtors_aux>:
  400ec0:	80 3d 11 46 20 00 00 	cmpb   $0x0,0x204611(%rip)        # 6054d8 <completed.6355>
  400ec7:	75 11                	jne    400eda <__do_global_dtors_aux+0x1a>
  400ec9:	55                   	push   %rbp
  400eca:	48 89 e5             	mov    %rsp,%rbp
  400ecd:	e8 7e ff ff ff       	callq  400e50 <deregister_tm_clones>
  400ed2:	5d                   	pop    %rbp
  400ed3:	c6 05 fe 45 20 00 01 	movb   $0x1,0x2045fe(%rip)        # 6054d8 <completed.6355>
  400eda:	f3 c3                	repz retq 
  400edc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ee0 <frame_dummy>:
  400ee0:	48 83 3d 38 3f 20 00 	cmpq   $0x0,0x203f38(%rip)        # 604e20 <__JCR_END__>
  400ee7:	00 
  400ee8:	74 1e                	je     400f08 <frame_dummy+0x28>
  400eea:	b8 00 00 00 00       	mov    $0x0,%eax
  400eef:	48 85 c0             	test   %rax,%rax
  400ef2:	74 14                	je     400f08 <frame_dummy+0x28>
  400ef4:	55                   	push   %rbp
  400ef5:	bf 20 4e 60 00       	mov    $0x604e20,%edi
  400efa:	48 89 e5             	mov    %rsp,%rbp
  400efd:	ff d0                	callq  *%rax
  400eff:	5d                   	pop    %rbp
  400f00:	e9 7b ff ff ff       	jmpq   400e80 <register_tm_clones>
  400f05:	0f 1f 00             	nopl   (%rax)
  400f08:	e9 73 ff ff ff       	jmpq   400e80 <register_tm_clones>
  400f0d:	0f 1f 00             	nopl   (%rax)

0000000000400f10 <usage>:
  400f10:	48 83 ec 08          	sub    $0x8,%rsp
  400f14:	48 89 fe             	mov    %rdi,%rsi
  400f17:	83 3d ea 45 20 00 00 	cmpl   $0x0,0x2045ea(%rip)        # 605508 <is_checker>
  400f1e:	74 39                	je     400f59 <usage+0x49>
  400f20:	bf 30 2c 40 00       	mov    $0x402c30,%edi
  400f25:	b8 00 00 00 00       	mov    $0x0,%eax
  400f2a:	e8 51 fd ff ff       	callq  400c80 <printf@plt>
  400f2f:	bf 68 2c 40 00       	mov    $0x402c68,%edi
  400f34:	e8 17 fd ff ff       	callq  400c50 <puts@plt>
  400f39:	bf e0 2d 40 00       	mov    $0x402de0,%edi
  400f3e:	e8 0d fd ff ff       	callq  400c50 <puts@plt>
  400f43:	bf 90 2c 40 00       	mov    $0x402c90,%edi
  400f48:	e8 03 fd ff ff       	callq  400c50 <puts@plt>
  400f4d:	bf fa 2d 40 00       	mov    $0x402dfa,%edi
  400f52:	e8 f9 fc ff ff       	callq  400c50 <puts@plt>
  400f57:	eb 2d                	jmp    400f86 <usage+0x76>
  400f59:	bf 16 2e 40 00       	mov    $0x402e16,%edi
  400f5e:	b8 00 00 00 00       	mov    $0x0,%eax
  400f63:	e8 18 fd ff ff       	callq  400c80 <printf@plt>
  400f68:	bf b8 2c 40 00       	mov    $0x402cb8,%edi
  400f6d:	e8 de fc ff ff       	callq  400c50 <puts@plt>
  400f72:	bf e0 2c 40 00       	mov    $0x402ce0,%edi
  400f77:	e8 d4 fc ff ff       	callq  400c50 <puts@plt>
  400f7c:	bf 34 2e 40 00       	mov    $0x402e34,%edi
  400f81:	e8 ca fc ff ff       	callq  400c50 <puts@plt>
  400f86:	bf 00 00 00 00       	mov    $0x0,%edi
  400f8b:	e8 60 fe ff ff       	callq  400df0 <exit@plt>

0000000000400f90 <initialize_target>:
  400f90:	55                   	push   %rbp
  400f91:	53                   	push   %rbx
  400f92:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400f99:	89 f5                	mov    %esi,%ebp
  400f9b:	89 3d 57 45 20 00    	mov    %edi,0x204557(%rip)        # 6054f8 <check_level>
  400fa1:	8b 3d c1 41 20 00    	mov    0x2041c1(%rip),%edi        # 605168 <target_id>
  400fa7:	e8 c7 1b 00 00       	callq  402b73 <gencookie>
  400fac:	89 05 52 45 20 00    	mov    %eax,0x204552(%rip)        # 605504 <cookie>
  400fb2:	89 c7                	mov    %eax,%edi
  400fb4:	e8 ba 1b 00 00       	callq  402b73 <gencookie>
  400fb9:	89 05 41 45 20 00    	mov    %eax,0x204541(%rip)        # 605500 <authkey>
  400fbf:	8b 05 a3 41 20 00    	mov    0x2041a3(%rip),%eax        # 605168 <target_id>
  400fc5:	8d 78 01             	lea    0x1(%rax),%edi
  400fc8:	e8 53 fc ff ff       	callq  400c20 <srandom@plt>
  400fcd:	e8 7e fd ff ff       	callq  400d50 <random@plt>
  400fd2:	89 c7                	mov    %eax,%edi
  400fd4:	e8 ca 02 00 00       	callq  4012a3 <scramble>
  400fd9:	89 c3                	mov    %eax,%ebx
  400fdb:	85 ed                	test   %ebp,%ebp
  400fdd:	74 18                	je     400ff7 <initialize_target+0x67>
  400fdf:	bf 00 00 00 00       	mov    $0x0,%edi
  400fe4:	e8 57 fd ff ff       	callq  400d40 <time@plt>
  400fe9:	89 c7                	mov    %eax,%edi
  400feb:	e8 30 fc ff ff       	callq  400c20 <srandom@plt>
  400ff0:	e8 5b fd ff ff       	callq  400d50 <random@plt>
  400ff5:	eb 05                	jmp    400ffc <initialize_target+0x6c>
  400ff7:	b8 00 00 00 00       	mov    $0x0,%eax
  400ffc:	01 c3                	add    %eax,%ebx
  400ffe:	0f b7 db             	movzwl %bx,%ebx
  401001:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  401008:	89 c0                	mov    %eax,%eax
  40100a:	48 89 05 8f 44 20 00 	mov    %rax,0x20448f(%rip)        # 6054a0 <buf_offset>
  401011:	c6 05 10 51 20 00 72 	movb   $0x72,0x205110(%rip)        # 606128 <target_prefix>
  401018:	83 3d 89 44 20 00 00 	cmpl   $0x0,0x204489(%rip)        # 6054a8 <notify>
  40101f:	0f 84 b1 00 00 00    	je     4010d6 <initialize_target+0x146>
  401025:	83 3d dc 44 20 00 00 	cmpl   $0x0,0x2044dc(%rip)        # 605508 <is_checker>
  40102c:	0f 85 a4 00 00 00    	jne    4010d6 <initialize_target+0x146>
  401032:	be 00 01 00 00       	mov    $0x100,%esi
  401037:	48 89 e7             	mov    %rsp,%rdi
  40103a:	e8 91 fd ff ff       	callq  400dd0 <gethostname@plt>
  40103f:	85 c0                	test   %eax,%eax
  401041:	74 25                	je     401068 <initialize_target+0xd8>
  401043:	bf 10 2d 40 00       	mov    $0x402d10,%edi
  401048:	e8 03 fc ff ff       	callq  400c50 <puts@plt>
  40104d:	bf 08 00 00 00       	mov    $0x8,%edi
  401052:	e8 99 fd ff ff       	callq  400df0 <exit@plt>
  401057:	48 89 e6             	mov    %rsp,%rsi
  40105a:	e8 a1 fb ff ff       	callq  400c00 <strcasecmp@plt>
  40105f:	85 c0                	test   %eax,%eax
  401061:	74 21                	je     401084 <initialize_target+0xf4>
  401063:	83 c3 01             	add    $0x1,%ebx
  401066:	eb 05                	jmp    40106d <initialize_target+0xdd>
  401068:	bb 00 00 00 00       	mov    $0x0,%ebx
  40106d:	48 63 c3             	movslq %ebx,%rax
  401070:	48 8b 3c c5 80 51 60 	mov    0x605180(,%rax,8),%rdi
  401077:	00 
  401078:	48 85 ff             	test   %rdi,%rdi
  40107b:	75 da                	jne    401057 <initialize_target+0xc7>
  40107d:	b8 00 00 00 00       	mov    $0x0,%eax
  401082:	eb 05                	jmp    401089 <initialize_target+0xf9>
  401084:	b8 01 00 00 00       	mov    $0x1,%eax
  401089:	85 c0                	test   %eax,%eax
  40108b:	75 17                	jne    4010a4 <initialize_target+0x114>
  40108d:	48 89 e6             	mov    %rsp,%rsi
  401090:	bf 48 2d 40 00       	mov    $0x402d48,%edi
  401095:	e8 e6 fb ff ff       	callq  400c80 <printf@plt>
  40109a:	bf 08 00 00 00       	mov    $0x8,%edi
  40109f:	e8 4c fd ff ff       	callq  400df0 <exit@plt>
  4010a4:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4010ab:	00 
  4010ac:	e8 59 18 00 00       	callq  40290a <init_driver>
  4010b1:	85 c0                	test   %eax,%eax
  4010b3:	79 21                	jns    4010d6 <initialize_target+0x146>
  4010b5:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4010bc:	00 
  4010bd:	bf 88 2d 40 00       	mov    $0x402d88,%edi
  4010c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4010c7:	e8 b4 fb ff ff       	callq  400c80 <printf@plt>
  4010cc:	bf 08 00 00 00       	mov    $0x8,%edi
  4010d1:	e8 1a fd ff ff       	callq  400df0 <exit@plt>
  4010d6:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  4010dd:	5b                   	pop    %rbx
  4010de:	5d                   	pop    %rbp
  4010df:	c3                   	retq   

00000000004010e0 <main>:
  4010e0:	41 56                	push   %r14
  4010e2:	41 55                	push   %r13
  4010e4:	41 54                	push   %r12
  4010e6:	55                   	push   %rbp
  4010e7:	53                   	push   %rbx
  4010e8:	41 89 fc             	mov    %edi,%r12d
  4010eb:	48 89 f3             	mov    %rsi,%rbx
  4010ee:	be 31 1d 40 00       	mov    $0x401d31,%esi
  4010f3:	bf 0b 00 00 00       	mov    $0xb,%edi
  4010f8:	e8 e3 fb ff ff       	callq  400ce0 <signal@plt>
  4010fd:	be e3 1c 40 00       	mov    $0x401ce3,%esi
  401102:	bf 07 00 00 00       	mov    $0x7,%edi
  401107:	e8 d4 fb ff ff       	callq  400ce0 <signal@plt>
  40110c:	be 7f 1d 40 00       	mov    $0x401d7f,%esi
  401111:	bf 04 00 00 00       	mov    $0x4,%edi
  401116:	e8 c5 fb ff ff       	callq  400ce0 <signal@plt>
  40111b:	83 3d e6 43 20 00 00 	cmpl   $0x0,0x2043e6(%rip)        # 605508 <is_checker>
  401122:	74 20                	je     401144 <main+0x64>
  401124:	be cd 1d 40 00       	mov    $0x401dcd,%esi
  401129:	bf 0e 00 00 00       	mov    $0xe,%edi
  40112e:	e8 ad fb ff ff       	callq  400ce0 <signal@plt>
  401133:	bf 05 00 00 00       	mov    $0x5,%edi
  401138:	e8 63 fb ff ff       	callq  400ca0 <alarm@plt>
  40113d:	bd 52 2e 40 00       	mov    $0x402e52,%ebp
  401142:	eb 05                	jmp    401149 <main+0x69>
  401144:	bd 4d 2e 40 00       	mov    $0x402e4d,%ebp
  401149:	48 8b 05 70 43 20 00 	mov    0x204370(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401150:	48 89 05 99 43 20 00 	mov    %rax,0x204399(%rip)        # 6054f0 <infile>
  401157:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40115d:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401163:	e9 b9 00 00 00       	jmpq   401221 <main+0x141>
  401168:	83 e8 61             	sub    $0x61,%eax
  40116b:	3c 10                	cmp    $0x10,%al
  40116d:	0f 87 93 00 00 00    	ja     401206 <main+0x126>
  401173:	0f b6 c0             	movzbl %al,%eax
  401176:	ff 24 c5 98 2e 40 00 	jmpq   *0x402e98(,%rax,8)
  40117d:	48 8b 3b             	mov    (%rbx),%rdi
  401180:	e8 8b fd ff ff       	callq  400f10 <usage>
  401185:	be f5 30 40 00       	mov    $0x4030f5,%esi
  40118a:	48 8b 3d 37 43 20 00 	mov    0x204337(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401191:	e8 0a fc ff ff       	callq  400da0 <fopen@plt>
  401196:	48 89 05 53 43 20 00 	mov    %rax,0x204353(%rip)        # 6054f0 <infile>
  40119d:	48 85 c0             	test   %rax,%rax
  4011a0:	75 7f                	jne    401221 <main+0x141>
  4011a2:	48 8b 15 1f 43 20 00 	mov    0x20431f(%rip),%rdx        # 6054c8 <optarg@@GLIBC_2.2.5>
  4011a9:	be 5a 2e 40 00       	mov    $0x402e5a,%esi
  4011ae:	48 8b 3d 1b 43 20 00 	mov    0x20431b(%rip),%rdi        # 6054d0 <stderr@@GLIBC_2.2.5>
  4011b5:	e8 46 fb ff ff       	callq  400d00 <fprintf@plt>
  4011ba:	b8 01 00 00 00       	mov    $0x1,%eax
  4011bf:	e9 d6 00 00 00       	jmpq   40129a <main+0x1ba>
  4011c4:	ba 10 00 00 00       	mov    $0x10,%edx
  4011c9:	be 00 00 00 00       	mov    $0x0,%esi
  4011ce:	48 8b 3d f3 42 20 00 	mov    0x2042f3(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4011d5:	e8 e6 fb ff ff       	callq  400dc0 <strtoul@plt>
  4011da:	41 89 c6             	mov    %eax,%r14d
  4011dd:	eb 42                	jmp    401221 <main+0x141>
  4011df:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011e4:	be 00 00 00 00       	mov    $0x0,%esi
  4011e9:	48 8b 3d d8 42 20 00 	mov    0x2042d8(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4011f0:	e8 2b fb ff ff       	callq  400d20 <strtol@plt>
  4011f5:	41 89 c5             	mov    %eax,%r13d
  4011f8:	eb 27                	jmp    401221 <main+0x141>
  4011fa:	c7 05 a4 42 20 00 00 	movl   $0x0,0x2042a4(%rip)        # 6054a8 <notify>
  401201:	00 00 00 
  401204:	eb 1b                	jmp    401221 <main+0x141>
  401206:	40 0f be f6          	movsbl %sil,%esi
  40120a:	bf 77 2e 40 00       	mov    $0x402e77,%edi
  40120f:	b8 00 00 00 00       	mov    $0x0,%eax
  401214:	e8 67 fa ff ff       	callq  400c80 <printf@plt>
  401219:	48 8b 3b             	mov    (%rbx),%rdi
  40121c:	e8 ef fc ff ff       	callq  400f10 <usage>
  401221:	48 89 ea             	mov    %rbp,%rdx
  401224:	48 89 de             	mov    %rbx,%rsi
  401227:	44 89 e7             	mov    %r12d,%edi
  40122a:	e8 81 fb ff ff       	callq  400db0 <getopt@plt>
  40122f:	89 c6                	mov    %eax,%esi
  401231:	3c ff                	cmp    $0xff,%al
  401233:	0f 85 2f ff ff ff    	jne    401168 <main+0x88>
  401239:	be 01 00 00 00       	mov    $0x1,%esi
  40123e:	44 89 ef             	mov    %r13d,%edi
  401241:	e8 4a fd ff ff       	callq  400f90 <initialize_target>
  401246:	83 3d bb 42 20 00 00 	cmpl   $0x0,0x2042bb(%rip)        # 605508 <is_checker>
  40124d:	74 25                	je     401274 <main+0x194>
  40124f:	44 3b 35 aa 42 20 00 	cmp    0x2042aa(%rip),%r14d        # 605500 <authkey>
  401256:	74 1c                	je     401274 <main+0x194>
  401258:	44 89 f6             	mov    %r14d,%esi
  40125b:	bf b0 2d 40 00       	mov    $0x402db0,%edi
  401260:	b8 00 00 00 00       	mov    $0x0,%eax
  401265:	e8 16 fa ff ff       	callq  400c80 <printf@plt>
  40126a:	b8 00 00 00 00       	mov    $0x0,%eax
  40126f:	e8 77 07 00 00       	callq  4019eb <check_fail>
  401274:	8b 35 8a 42 20 00    	mov    0x20428a(%rip),%esi        # 605504 <cookie>
  40127a:	bf 8a 2e 40 00       	mov    $0x402e8a,%edi
  40127f:	b8 00 00 00 00       	mov    $0x0,%eax
  401284:	e8 f7 f9 ff ff       	callq  400c80 <printf@plt>
  401289:	48 8b 3d 10 42 20 00 	mov    0x204210(%rip),%rdi        # 6054a0 <buf_offset>
  401290:	e8 86 0b 00 00       	callq  401e1b <launch>
  401295:	b8 00 00 00 00       	mov    $0x0,%eax
  40129a:	5b                   	pop    %rbx
  40129b:	5d                   	pop    %rbp
  40129c:	41 5c                	pop    %r12
  40129e:	41 5d                	pop    %r13
  4012a0:	41 5e                	pop    %r14
  4012a2:	c3                   	retq   

00000000004012a3 <scramble>:
  4012a3:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a8:	eb 11                	jmp    4012bb <scramble+0x18>
  4012aa:	69 c8 cd cf 00 00    	imul   $0xcfcd,%eax,%ecx
  4012b0:	01 f9                	add    %edi,%ecx
  4012b2:	89 c2                	mov    %eax,%edx
  4012b4:	89 4c 94 d0          	mov    %ecx,-0x30(%rsp,%rdx,4)
  4012b8:	83 c0 01             	add    $0x1,%eax
  4012bb:	83 f8 09             	cmp    $0x9,%eax
  4012be:	76 ea                	jbe    4012aa <scramble+0x7>
  4012c0:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4012c4:	69 c0 1b 16 00 00    	imul   $0x161b,%eax,%eax
  4012ca:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4012ce:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4012d2:	69 c0 21 c9 00 00    	imul   $0xc921,%eax,%eax
  4012d8:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4012dc:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4012e0:	69 c0 91 d4 00 00    	imul   $0xd491,%eax,%eax
  4012e6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4012ea:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4012ee:	69 c0 e3 23 00 00    	imul   $0x23e3,%eax,%eax
  4012f4:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4012f8:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4012fc:	69 c0 85 ae 00 00    	imul   $0xae85,%eax,%eax
  401302:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401306:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40130a:	69 c0 f2 f6 00 00    	imul   $0xf6f2,%eax,%eax
  401310:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401314:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401318:	69 c0 23 4d 00 00    	imul   $0x4d23,%eax,%eax
  40131e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401322:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401326:	69 c0 41 f0 00 00    	imul   $0xf041,%eax,%eax
  40132c:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401330:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401334:	69 c0 22 b8 00 00    	imul   $0xb822,%eax,%eax
  40133a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40133e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401342:	69 c0 6c 51 00 00    	imul   $0x516c,%eax,%eax
  401348:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40134c:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401350:	69 c0 e5 a2 00 00    	imul   $0xa2e5,%eax,%eax
  401356:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40135a:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40135e:	69 c0 d8 73 00 00    	imul   $0x73d8,%eax,%eax
  401364:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401368:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40136c:	8d 04 80             	lea    (%rax,%rax,4),%eax
  40136f:	c1 e0 0b             	shl    $0xb,%eax
  401372:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401376:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40137a:	69 c0 e8 fe 00 00    	imul   $0xfee8,%eax,%eax
  401380:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401384:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401388:	69 c0 b7 b3 00 00    	imul   $0xb3b7,%eax,%eax
  40138e:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401392:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401396:	69 c0 68 31 00 00    	imul   $0x3168,%eax,%eax
  40139c:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4013a0:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4013a4:	69 c0 d4 e4 00 00    	imul   $0xe4d4,%eax,%eax
  4013aa:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4013ae:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4013b2:	69 c0 98 0d 00 00    	imul   $0xd98,%eax,%eax
  4013b8:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4013bc:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013c0:	69 c0 6f 8a 00 00    	imul   $0x8a6f,%eax,%eax
  4013c6:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013ca:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4013ce:	69 c0 c3 57 00 00    	imul   $0x57c3,%eax,%eax
  4013d4:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4013d8:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013dc:	69 c0 62 69 00 00    	imul   $0x6962,%eax,%eax
  4013e2:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013e6:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4013ea:	69 c0 18 c8 00 00    	imul   $0xc818,%eax,%eax
  4013f0:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4013f4:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4013f8:	69 c0 0d dc 00 00    	imul   $0xdc0d,%eax,%eax
  4013fe:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401402:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401406:	69 c0 5d aa 00 00    	imul   $0xaa5d,%eax,%eax
  40140c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401410:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401414:	69 c0 65 3b 00 00    	imul   $0x3b65,%eax,%eax
  40141a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40141e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401422:	69 c0 ec 96 00 00    	imul   $0x96ec,%eax,%eax
  401428:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40142c:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401430:	69 c0 f1 2b 00 00    	imul   $0x2bf1,%eax,%eax
  401436:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40143a:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40143e:	69 c0 ef 09 00 00    	imul   $0x9ef,%eax,%eax
  401444:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401448:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40144c:	69 c0 06 8f 00 00    	imul   $0x8f06,%eax,%eax
  401452:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401456:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40145a:	69 c0 8c b5 00 00    	imul   $0xb58c,%eax,%eax
  401460:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401464:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401468:	69 c0 e1 3e 00 00    	imul   $0x3ee1,%eax,%eax
  40146e:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401472:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401476:	69 c0 8f 0c 00 00    	imul   $0xc8f,%eax,%eax
  40147c:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401480:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401484:	69 c0 7f e1 00 00    	imul   $0xe17f,%eax,%eax
  40148a:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40148e:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401492:	69 c0 1a dd 00 00    	imul   $0xdd1a,%eax,%eax
  401498:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40149c:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014a0:	69 c0 a2 4b 00 00    	imul   $0x4ba2,%eax,%eax
  4014a6:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014aa:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4014ae:	69 c0 e2 a4 00 00    	imul   $0xa4e2,%eax,%eax
  4014b4:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4014b8:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4014bc:	69 c0 93 83 00 00    	imul   $0x8393,%eax,%eax
  4014c2:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4014c6:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4014ca:	69 c0 8b 6b 00 00    	imul   $0x6b8b,%eax,%eax
  4014d0:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4014d4:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014d8:	69 c0 55 25 00 00    	imul   $0x2555,%eax,%eax
  4014de:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014e2:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4014e6:	69 c0 d1 f3 00 00    	imul   $0xf3d1,%eax,%eax
  4014ec:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4014f0:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4014f4:	69 c0 b2 11 00 00    	imul   $0x11b2,%eax,%eax
  4014fa:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4014fe:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401502:	69 c0 05 3f 00 00    	imul   $0x3f05,%eax,%eax
  401508:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40150c:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401510:	69 c0 81 95 00 00    	imul   $0x9581,%eax,%eax
  401516:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40151a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40151e:	69 c0 95 91 00 00    	imul   $0x9195,%eax,%eax
  401524:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401528:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40152c:	69 c0 cd 51 00 00    	imul   $0x51cd,%eax,%eax
  401532:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401536:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40153a:	69 c0 45 67 00 00    	imul   $0x6745,%eax,%eax
  401540:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401544:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401548:	69 c0 17 2e 00 00    	imul   $0x2e17,%eax,%eax
  40154e:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401552:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401556:	69 c0 63 b4 00 00    	imul   $0xb463,%eax,%eax
  40155c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401560:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401564:	69 c0 fc 8d 00 00    	imul   $0x8dfc,%eax,%eax
  40156a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40156e:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401572:	69 c0 84 7b 00 00    	imul   $0x7b84,%eax,%eax
  401578:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40157c:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401580:	69 c0 5b c6 00 00    	imul   $0xc65b,%eax,%eax
  401586:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40158a:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40158e:	69 c0 a4 8e 00 00    	imul   $0x8ea4,%eax,%eax
  401594:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401598:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40159c:	69 c0 61 8d 00 00    	imul   $0x8d61,%eax,%eax
  4015a2:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4015a6:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4015aa:	69 c0 90 a9 00 00    	imul   $0xa990,%eax,%eax
  4015b0:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4015b4:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4015b8:	69 c0 17 10 00 00    	imul   $0x1017,%eax,%eax
  4015be:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4015c2:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4015c6:	69 c0 71 13 00 00    	imul   $0x1371,%eax,%eax
  4015cc:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4015d0:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4015d4:	69 c0 1e 28 00 00    	imul   $0x281e,%eax,%eax
  4015da:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4015de:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015e2:	69 c0 6e 5f 00 00    	imul   $0x5f6e,%eax,%eax
  4015e8:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015ec:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015f0:	69 c0 6b 9b 00 00    	imul   $0x9b6b,%eax,%eax
  4015f6:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015fa:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015fe:	69 c0 27 e2 00 00    	imul   $0xe227,%eax,%eax
  401604:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401608:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40160c:	69 c0 25 38 00 00    	imul   $0x3825,%eax,%eax
  401612:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401616:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40161a:	69 c0 e6 7d 00 00    	imul   $0x7de6,%eax,%eax
  401620:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401624:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401628:	69 c0 42 bd 00 00    	imul   $0xbd42,%eax,%eax
  40162e:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401632:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401636:	69 c0 d2 75 00 00    	imul   $0x75d2,%eax,%eax
  40163c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401640:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401644:	69 c0 c7 c3 00 00    	imul   $0xc3c7,%eax,%eax
  40164a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40164e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401652:	69 c0 dd 24 00 00    	imul   $0x24dd,%eax,%eax
  401658:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40165c:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401660:	69 c0 bd 11 00 00    	imul   $0x11bd,%eax,%eax
  401666:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40166a:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40166e:	69 c0 11 d4 00 00    	imul   $0xd411,%eax,%eax
  401674:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401678:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40167c:	69 c0 b0 ad 00 00    	imul   $0xadb0,%eax,%eax
  401682:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401686:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40168a:	69 c0 d5 51 00 00    	imul   $0x51d5,%eax,%eax
  401690:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401694:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401698:	69 c0 02 1b 00 00    	imul   $0x1b02,%eax,%eax
  40169e:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016a2:	ba 00 00 00 00       	mov    $0x0,%edx
  4016a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4016ac:	eb 0b                	jmp    4016b9 <scramble+0x416>
  4016ae:	89 d1                	mov    %edx,%ecx
  4016b0:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  4016b4:	01 c8                	add    %ecx,%eax
  4016b6:	83 c2 01             	add    $0x1,%edx
  4016b9:	83 fa 09             	cmp    $0x9,%edx
  4016bc:	76 f0                	jbe    4016ae <scramble+0x40b>
  4016be:	f3 c3                	repz retq 

00000000004016c0 <getbuf>:
  4016c0:	48 83 ec 28          	sub    $0x28,%rsp
  4016c4:	48 89 e7             	mov    %rsp,%rdi
  4016c7:	e8 4e 03 00 00       	callq  401a1a <Gets>
  4016cc:	b8 01 00 00 00       	mov    $0x1,%eax
  4016d1:	48 83 c4 28          	add    $0x28,%rsp
  4016d5:	c3                   	retq   

00000000004016d6 <touch1>:
  4016d6:	48 83 ec 08          	sub    $0x8,%rsp
  4016da:	c7 05 18 3e 20 00 01 	movl   $0x1,0x203e18(%rip)        # 6054fc <vlevel>
  4016e1:	00 00 00 
  4016e4:	bf 47 2f 40 00       	mov    $0x402f47,%edi
  4016e9:	e8 62 f5 ff ff       	callq  400c50 <puts@plt>
  4016ee:	bf 01 00 00 00       	mov    $0x1,%edi
  4016f3:	e8 11 05 00 00       	callq  401c09 <validate>
  4016f8:	bf 00 00 00 00       	mov    $0x0,%edi
  4016fd:	e8 ee f6 ff ff       	callq  400df0 <exit@plt>

0000000000401702 <touch2>:
  401702:	48 83 ec 08          	sub    $0x8,%rsp
  401706:	89 fe                	mov    %edi,%esi
  401708:	c7 05 ea 3d 20 00 02 	movl   $0x2,0x203dea(%rip)        # 6054fc <vlevel>
  40170f:	00 00 00 
  401712:	3b 3d ec 3d 20 00    	cmp    0x203dec(%rip),%edi        # 605504 <cookie>
  401718:	75 1b                	jne    401735 <touch2+0x33>
  40171a:	bf 70 2f 40 00       	mov    $0x402f70,%edi
  40171f:	b8 00 00 00 00       	mov    $0x0,%eax
  401724:	e8 57 f5 ff ff       	callq  400c80 <printf@plt>
  401729:	bf 02 00 00 00       	mov    $0x2,%edi
  40172e:	e8 d6 04 00 00       	callq  401c09 <validate>
  401733:	eb 19                	jmp    40174e <touch2+0x4c>
  401735:	bf 98 2f 40 00       	mov    $0x402f98,%edi
  40173a:	b8 00 00 00 00       	mov    $0x0,%eax
  40173f:	e8 3c f5 ff ff       	callq  400c80 <printf@plt>
  401744:	bf 02 00 00 00       	mov    $0x2,%edi
  401749:	e8 6d 05 00 00       	callq  401cbb <fail>
  40174e:	bf 00 00 00 00       	mov    $0x0,%edi
  401753:	e8 98 f6 ff ff       	callq  400df0 <exit@plt>

0000000000401758 <hexmatch>:
  401758:	41 54                	push   %r12
  40175a:	55                   	push   %rbp
  40175b:	53                   	push   %rbx
  40175c:	48 83 ec 70          	sub    $0x70,%rsp
  401760:	41 89 fc             	mov    %edi,%r12d
  401763:	48 89 f5             	mov    %rsi,%rbp
  401766:	e8 e5 f5 ff ff       	callq  400d50 <random@plt>
  40176b:	48 89 c1             	mov    %rax,%rcx
  40176e:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401775:	0a d7 a3 
  401778:	48 f7 ea             	imul   %rdx
  40177b:	48 8d 04 0a          	lea    (%rdx,%rcx,1),%rax
  40177f:	48 c1 f8 06          	sar    $0x6,%rax
  401783:	48 89 ce             	mov    %rcx,%rsi
  401786:	48 c1 fe 3f          	sar    $0x3f,%rsi
  40178a:	48 29 f0             	sub    %rsi,%rax
  40178d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401791:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401795:	48 c1 e0 02          	shl    $0x2,%rax
  401799:	48 29 c1             	sub    %rax,%rcx
  40179c:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  4017a0:	44 89 e2             	mov    %r12d,%edx
  4017a3:	be 64 2f 40 00       	mov    $0x402f64,%esi
  4017a8:	48 89 df             	mov    %rbx,%rdi
  4017ab:	b8 00 00 00 00       	mov    $0x0,%eax
  4017b0:	e8 2b f6 ff ff       	callq  400de0 <sprintf@plt>
  4017b5:	ba 09 00 00 00       	mov    $0x9,%edx
  4017ba:	48 89 de             	mov    %rbx,%rsi
  4017bd:	48 89 ef             	mov    %rbp,%rdi
  4017c0:	e8 6b f4 ff ff       	callq  400c30 <strncmp@plt>
  4017c5:	85 c0                	test   %eax,%eax
  4017c7:	0f 94 c0             	sete   %al
  4017ca:	0f b6 c0             	movzbl %al,%eax
  4017cd:	48 83 c4 70          	add    $0x70,%rsp
  4017d1:	5b                   	pop    %rbx
  4017d2:	5d                   	pop    %rbp
  4017d3:	41 5c                	pop    %r12
  4017d5:	c3                   	retq   

00000000004017d6 <touch3>:
  4017d6:	53                   	push   %rbx
  4017d7:	48 89 fb             	mov    %rdi,%rbx
  4017da:	c7 05 18 3d 20 00 03 	movl   $0x3,0x203d18(%rip)        # 6054fc <vlevel>
  4017e1:	00 00 00 
  4017e4:	48 89 fe             	mov    %rdi,%rsi
  4017e7:	8b 3d 17 3d 20 00    	mov    0x203d17(%rip),%edi        # 605504 <cookie>
  4017ed:	e8 66 ff ff ff       	callq  401758 <hexmatch>
  4017f2:	85 c0                	test   %eax,%eax
  4017f4:	74 1e                	je     401814 <touch3+0x3e>
  4017f6:	48 89 de             	mov    %rbx,%rsi
  4017f9:	bf c0 2f 40 00       	mov    $0x402fc0,%edi
  4017fe:	b8 00 00 00 00       	mov    $0x0,%eax
  401803:	e8 78 f4 ff ff       	callq  400c80 <printf@plt>
  401808:	bf 03 00 00 00       	mov    $0x3,%edi
  40180d:	e8 f7 03 00 00       	callq  401c09 <validate>
  401812:	eb 1c                	jmp    401830 <touch3+0x5a>
  401814:	48 89 de             	mov    %rbx,%rsi
  401817:	bf e8 2f 40 00       	mov    $0x402fe8,%edi
  40181c:	b8 00 00 00 00       	mov    $0x0,%eax
  401821:	e8 5a f4 ff ff       	callq  400c80 <printf@plt>
  401826:	bf 03 00 00 00       	mov    $0x3,%edi
  40182b:	e8 8b 04 00 00       	callq  401cbb <fail>
  401830:	bf 00 00 00 00       	mov    $0x0,%edi
  401835:	e8 b6 f5 ff ff       	callq  400df0 <exit@plt>

000000000040183a <test>:
  40183a:	48 83 ec 08          	sub    $0x8,%rsp
  40183e:	b8 00 00 00 00       	mov    $0x0,%eax
  401843:	e8 78 fe ff ff       	callq  4016c0 <getbuf>
  401848:	89 c6                	mov    %eax,%esi
  40184a:	bf 10 30 40 00       	mov    $0x403010,%edi
  40184f:	b8 00 00 00 00       	mov    $0x0,%eax
  401854:	e8 27 f4 ff ff       	callq  400c80 <printf@plt>
  401859:	48 83 c4 08          	add    $0x8,%rsp
  40185d:	c3                   	retq   

000000000040185e <start_farm>:
  40185e:	b8 01 00 00 00       	mov    $0x1,%eax
  401863:	c3                   	retq   

0000000000401864 <setval_407>:
  401864:	c7 07 58 94 90 90    	movl   $0x90909458,(%rdi)
  40186a:	c3                   	retq   

000000000040186b <addval_472>:
  40186b:	8d 87 48 89 c7 91    	lea    -0x6e3876b8(%rdi),%eax
  401871:	c3                   	retq   

0000000000401872 <setval_437>:
  401872:	c7 07 58 90 90 90    	movl   $0x90909058,(%rdi)
  401878:	c3                   	retq   

0000000000401879 <getval_309>:
  401879:	b8 58 90 90 c3       	mov    $0xc3909058,%eax
  40187e:	c3                   	retq   

000000000040187f <addval_473>:
  40187f:	8d 87 69 d2 58 c7    	lea    -0x38a72d97(%rdi),%eax
  401885:	c3                   	retq   

0000000000401886 <setval_254>:
  401886:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  40188c:	c3                   	retq   

000000000040188d <getval_471>:
  40188d:	b8 48 89 c7 c3       	mov    $0xc3c78948,%eax
  401892:	c3                   	retq   

0000000000401893 <addval_195>:
  401893:	8d 87 48 c9 c7 90    	lea    -0x6f3836b8(%rdi),%eax
  401899:	c3                   	retq   

000000000040189a <mid_farm>:
  40189a:	b8 01 00 00 00       	mov    $0x1,%eax
  40189f:	c3                   	retq   

00000000004018a0 <add_xy>:
  4018a0:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4018a4:	c3                   	retq   

00000000004018a5 <addval_343>:
  4018a5:	8d 87 99 d1 84 c9    	lea    -0x367b2e67(%rdi),%eax
  4018ab:	c3                   	retq   

00000000004018ac <addval_103>:
  4018ac:	8d 87 89 d1 28 d2    	lea    -0x2dd72e77(%rdi),%eax
  4018b2:	c3                   	retq   

00000000004018b3 <addval_194>:
  4018b3:	8d 87 48 89 e0 c1    	lea    -0x3e1f76b8(%rdi),%eax
  4018b9:	c3                   	retq   

00000000004018ba <setval_261>:
  4018ba:	c7 07 c9 ce 90 c3    	movl   $0xc390cec9,(%rdi)
  4018c0:	c3                   	retq   

00000000004018c1 <addval_282>:
  4018c1:	8d 87 8d d1 90 c3    	lea    -0x3c6f2e73(%rdi),%eax
  4018c7:	c3                   	retq   

00000000004018c8 <getval_205>:
  4018c8:	b8 09 c2 08 d2       	mov    $0xd208c209,%eax
  4018cd:	c3                   	retq   

00000000004018ce <setval_456>:
  4018ce:	c7 07 89 d1 84 d2    	movl   $0xd284d189,(%rdi)
  4018d4:	c3                   	retq   

00000000004018d5 <addval_348>:
  4018d5:	8d 87 89 ce 28 c0    	lea    -0x3fd73177(%rdi),%eax
  4018db:	c3                   	retq   

00000000004018dc <setval_202>:
  4018dc:	c7 07 81 ce 20 c9    	movl   $0xc920ce81,(%rdi)
  4018e2:	c3                   	retq   

00000000004018e3 <addval_238>:
  4018e3:	8d 87 89 c2 08 d2    	lea    -0x2df73d77(%rdi),%eax
  4018e9:	c3                   	retq   

00000000004018ea <getval_458>:
  4018ea:	b8 09 c2 08 db       	mov    $0xdb08c209,%eax
  4018ef:	c3                   	retq   

00000000004018f0 <setval_305>:
  4018f0:	c7 07 89 ce 90 c1    	movl   $0xc190ce89,(%rdi)
  4018f6:	c3                   	retq   

00000000004018f7 <getval_271>:
  4018f7:	b8 ee 89 c2 c1       	mov    $0xc1c289ee,%eax
  4018fc:	c3                   	retq   

00000000004018fd <setval_280>:
  4018fd:	c7 07 48 89 e0 94    	movl   $0x94e08948,(%rdi)
  401903:	c3                   	retq   

0000000000401904 <addval_375>:
  401904:	8d 87 89 ce 18 c0    	lea    -0x3fe73177(%rdi),%eax
  40190a:	c3                   	retq   

000000000040190b <addval_355>:
  40190b:	8d 87 c6 89 c2 90    	lea    -0x6f3d763a(%rdi),%eax
  401911:	c3                   	retq   

0000000000401912 <getval_359>:
  401912:	b8 81 c2 84 d2       	mov    $0xd284c281,%eax
  401917:	c3                   	retq   

0000000000401918 <addval_477>:
  401918:	8d 87 81 c2 c3 57    	lea    0x57c3c281(%rdi),%eax
  40191e:	c3                   	retq   

000000000040191f <setval_134>:
  40191f:	c7 07 89 ce 84 c9    	movl   $0xc984ce89,(%rdi)
  401925:	c3                   	retq   

0000000000401926 <addval_448>:
  401926:	8d 87 48 89 e0 91    	lea    -0x6e1f76b8(%rdi),%eax
  40192c:	c3                   	retq   

000000000040192d <setval_410>:
  40192d:	c7 07 a9 ce 84 db    	movl   $0xdb84cea9,(%rdi)
  401933:	c3                   	retq   

0000000000401934 <addval_227>:
  401934:	8d 87 89 ce 90 c3    	lea    -0x3c6f3177(%rdi),%eax
  40193a:	c3                   	retq   

000000000040193b <getval_404>:
  40193b:	b8 89 d1 90 c7       	mov    $0xc790d189,%eax
  401940:	c3                   	retq   

0000000000401941 <setval_460>:
  401941:	c7 07 81 c2 38 d2    	movl   $0xd238c281,(%rdi)
  401947:	c3                   	retq   

0000000000401948 <getval_315>:
  401948:	b8 c9 d1 90 90       	mov    $0x9090d1c9,%eax
  40194d:	c3                   	retq   

000000000040194e <getval_463>:
  40194e:	b8 89 d1 84 db       	mov    $0xdb84d189,%eax
  401953:	c3                   	retq   

0000000000401954 <getval_427>:
  401954:	b8 08 89 e0 90       	mov    $0x90e08908,%eax
  401959:	c3                   	retq   

000000000040195a <addval_397>:
  40195a:	8d 87 89 d1 94 90    	lea    -0x6f6b2e77(%rdi),%eax
  401960:	c3                   	retq   

0000000000401961 <getval_257>:
  401961:	b8 48 89 e0 c3       	mov    $0xc3e08948,%eax
  401966:	c3                   	retq   

0000000000401967 <addval_162>:
  401967:	8d 87 80 40 89 e0    	lea    -0x1f76bf80(%rdi),%eax
  40196d:	c3                   	retq   

000000000040196e <getval_385>:
  40196e:	b8 48 89 e0 c2       	mov    $0xc2e08948,%eax
  401973:	c3                   	retq   

0000000000401974 <getval_415>:
  401974:	b8 48 89 e0 c3       	mov    $0xc3e08948,%eax
  401979:	c3                   	retq   

000000000040197a <end_farm>:
  40197a:	b8 01 00 00 00       	mov    $0x1,%eax
  40197f:	c3                   	retq   

0000000000401980 <save_char>:
  401980:	8b 05 9e 47 20 00    	mov    0x20479e(%rip),%eax        # 606124 <gets_cnt>
  401986:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  40198b:	7f 49                	jg     4019d6 <save_char+0x56>
  40198d:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401990:	89 f9                	mov    %edi,%ecx
  401992:	c0 e9 04             	shr    $0x4,%cl
  401995:	83 e1 0f             	and    $0xf,%ecx
  401998:	0f b6 b1 30 33 40 00 	movzbl 0x403330(%rcx),%esi
  40199f:	48 63 ca             	movslq %edx,%rcx
  4019a2:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  4019a9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  4019ac:	83 e7 0f             	and    $0xf,%edi
  4019af:	0f b6 b7 30 33 40 00 	movzbl 0x403330(%rdi),%esi
  4019b6:	48 63 c9             	movslq %ecx,%rcx
  4019b9:	40 88 b1 20 55 60 00 	mov    %sil,0x605520(%rcx)
  4019c0:	83 c2 02             	add    $0x2,%edx
  4019c3:	48 63 d2             	movslq %edx,%rdx
  4019c6:	c6 82 20 55 60 00 20 	movb   $0x20,0x605520(%rdx)
  4019cd:	83 c0 01             	add    $0x1,%eax
  4019d0:	89 05 4e 47 20 00    	mov    %eax,0x20474e(%rip)        # 606124 <gets_cnt>
  4019d6:	f3 c3                	repz retq 

00000000004019d8 <save_term>:
  4019d8:	8b 05 46 47 20 00    	mov    0x204746(%rip),%eax        # 606124 <gets_cnt>
  4019de:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4019e1:	48 98                	cltq   
  4019e3:	c6 80 20 55 60 00 00 	movb   $0x0,0x605520(%rax)
  4019ea:	c3                   	retq   

00000000004019eb <check_fail>:
  4019eb:	48 83 ec 08          	sub    $0x8,%rsp
  4019ef:	0f be 35 32 47 20 00 	movsbl 0x204732(%rip),%esi        # 606128 <target_prefix>
  4019f6:	b9 20 55 60 00       	mov    $0x605520,%ecx
  4019fb:	8b 15 f7 3a 20 00    	mov    0x203af7(%rip),%edx        # 6054f8 <check_level>
  401a01:	bf 33 30 40 00       	mov    $0x403033,%edi
  401a06:	b8 00 00 00 00       	mov    $0x0,%eax
  401a0b:	e8 70 f2 ff ff       	callq  400c80 <printf@plt>
  401a10:	bf 01 00 00 00       	mov    $0x1,%edi
  401a15:	e8 d6 f3 ff ff       	callq  400df0 <exit@plt>

0000000000401a1a <Gets>:
  401a1a:	41 54                	push   %r12
  401a1c:	55                   	push   %rbp
  401a1d:	53                   	push   %rbx
  401a1e:	49 89 fc             	mov    %rdi,%r12
  401a21:	c7 05 f9 46 20 00 00 	movl   $0x0,0x2046f9(%rip)        # 606124 <gets_cnt>
  401a28:	00 00 00 
  401a2b:	48 89 fb             	mov    %rdi,%rbx
  401a2e:	eb 11                	jmp    401a41 <Gets+0x27>
  401a30:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a34:	88 03                	mov    %al,(%rbx)
  401a36:	0f b6 f8             	movzbl %al,%edi
  401a39:	e8 42 ff ff ff       	callq  401980 <save_char>
  401a3e:	48 89 eb             	mov    %rbp,%rbx
  401a41:	48 8b 3d a8 3a 20 00 	mov    0x203aa8(%rip),%rdi        # 6054f0 <infile>
  401a48:	e8 13 f3 ff ff       	callq  400d60 <_IO_getc@plt>
  401a4d:	83 f8 ff             	cmp    $0xffffffff,%eax
  401a50:	74 05                	je     401a57 <Gets+0x3d>
  401a52:	83 f8 0a             	cmp    $0xa,%eax
  401a55:	75 d9                	jne    401a30 <Gets+0x16>
  401a57:	c6 03 00             	movb   $0x0,(%rbx)
  401a5a:	b8 00 00 00 00       	mov    $0x0,%eax
  401a5f:	e8 74 ff ff ff       	callq  4019d8 <save_term>
  401a64:	4c 89 e0             	mov    %r12,%rax
  401a67:	5b                   	pop    %rbx
  401a68:	5d                   	pop    %rbp
  401a69:	41 5c                	pop    %r12
  401a6b:	c3                   	retq   

0000000000401a6c <notify_server>:
  401a6c:	83 3d 95 3a 20 00 00 	cmpl   $0x0,0x203a95(%rip)        # 605508 <is_checker>
  401a73:	0f 85 8e 01 00 00    	jne    401c07 <notify_server+0x19b>
  401a79:	53                   	push   %rbx
  401a7a:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401a81:	89 fb                	mov    %edi,%ebx
  401a83:	8b 05 9b 46 20 00    	mov    0x20469b(%rip),%eax        # 606124 <gets_cnt>
  401a89:	83 c0 64             	add    $0x64,%eax
  401a8c:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401a91:	7e 19                	jle    401aac <notify_server+0x40>
  401a93:	bf 68 31 40 00       	mov    $0x403168,%edi
  401a98:	b8 00 00 00 00       	mov    $0x0,%eax
  401a9d:	e8 de f1 ff ff       	callq  400c80 <printf@plt>
  401aa2:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa7:	e8 44 f3 ff ff       	callq  400df0 <exit@plt>
  401aac:	44 0f be 0d 74 46 20 	movsbl 0x204674(%rip),%r9d        # 606128 <target_prefix>
  401ab3:	00 
  401ab4:	83 3d ed 39 20 00 00 	cmpl   $0x0,0x2039ed(%rip)        # 6054a8 <notify>
  401abb:	74 09                	je     401ac6 <notify_server+0x5a>
  401abd:	44 8b 05 3c 3a 20 00 	mov    0x203a3c(%rip),%r8d        # 605500 <authkey>
  401ac4:	eb 06                	jmp    401acc <notify_server+0x60>
  401ac6:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401acc:	85 db                	test   %ebx,%ebx
  401ace:	74 07                	je     401ad7 <notify_server+0x6b>
  401ad0:	b9 49 30 40 00       	mov    $0x403049,%ecx
  401ad5:	eb 05                	jmp    401adc <notify_server+0x70>
  401ad7:	b9 4e 30 40 00       	mov    $0x40304e,%ecx
  401adc:	48 c7 44 24 08 20 55 	movq   $0x605520,0x8(%rsp)
  401ae3:	60 00 
  401ae5:	89 34 24             	mov    %esi,(%rsp)
  401ae8:	8b 15 7a 36 20 00    	mov    0x20367a(%rip),%edx        # 605168 <target_id>
  401aee:	be 53 30 40 00       	mov    $0x403053,%esi
  401af3:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  401afa:	00 
  401afb:	b8 00 00 00 00       	mov    $0x0,%eax
  401b00:	e8 db f2 ff ff       	callq  400de0 <sprintf@plt>
  401b05:	83 3d 9c 39 20 00 00 	cmpl   $0x0,0x20399c(%rip)        # 6054a8 <notify>
  401b0c:	74 78                	je     401b86 <notify_server+0x11a>
  401b0e:	85 db                	test   %ebx,%ebx
  401b10:	74 68                	je     401b7a <notify_server+0x10e>
  401b12:	4c 8d 4c 24 10       	lea    0x10(%rsp),%r9
  401b17:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b1d:	48 8d 8c 24 10 20 00 	lea    0x2010(%rsp),%rcx
  401b24:	00 
  401b25:	48 8b 15 44 36 20 00 	mov    0x203644(%rip),%rdx        # 605170 <lab>
  401b2c:	48 8b 35 45 36 20 00 	mov    0x203645(%rip),%rsi        # 605178 <course>
  401b33:	48 8b 3d 26 36 20 00 	mov    0x203626(%rip),%rdi        # 605160 <user_id>
  401b3a:	e8 94 0f 00 00       	callq  402ad3 <driver_post>
  401b3f:	85 c0                	test   %eax,%eax
  401b41:	79 1e                	jns    401b61 <notify_server+0xf5>
  401b43:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  401b48:	bf 6f 30 40 00       	mov    $0x40306f,%edi
  401b4d:	b8 00 00 00 00       	mov    $0x0,%eax
  401b52:	e8 29 f1 ff ff       	callq  400c80 <printf@plt>
  401b57:	bf 01 00 00 00       	mov    $0x1,%edi
  401b5c:	e8 8f f2 ff ff       	callq  400df0 <exit@plt>
  401b61:	bf 98 31 40 00       	mov    $0x403198,%edi
  401b66:	e8 e5 f0 ff ff       	callq  400c50 <puts@plt>
  401b6b:	bf 7b 30 40 00       	mov    $0x40307b,%edi
  401b70:	e8 db f0 ff ff       	callq  400c50 <puts@plt>
  401b75:	e9 85 00 00 00       	jmpq   401bff <notify_server+0x193>
  401b7a:	bf 85 30 40 00       	mov    $0x403085,%edi
  401b7f:	e8 cc f0 ff ff       	callq  400c50 <puts@plt>
  401b84:	eb 79                	jmp    401bff <notify_server+0x193>
  401b86:	85 db                	test   %ebx,%ebx
  401b88:	74 08                	je     401b92 <notify_server+0x126>
  401b8a:	be 49 30 40 00       	mov    $0x403049,%esi
  401b8f:	90                   	nop
  401b90:	eb 05                	jmp    401b97 <notify_server+0x12b>
  401b92:	be 4e 30 40 00       	mov    $0x40304e,%esi
  401b97:	bf d0 31 40 00       	mov    $0x4031d0,%edi
  401b9c:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba1:	e8 da f0 ff ff       	callq  400c80 <printf@plt>
  401ba6:	48 8b 35 b3 35 20 00 	mov    0x2035b3(%rip),%rsi        # 605160 <user_id>
  401bad:	bf 8c 30 40 00       	mov    $0x40308c,%edi
  401bb2:	b8 00 00 00 00       	mov    $0x0,%eax
  401bb7:	e8 c4 f0 ff ff       	callq  400c80 <printf@plt>
  401bbc:	48 8b 35 b5 35 20 00 	mov    0x2035b5(%rip),%rsi        # 605178 <course>
  401bc3:	bf 99 30 40 00       	mov    $0x403099,%edi
  401bc8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bcd:	e8 ae f0 ff ff       	callq  400c80 <printf@plt>
  401bd2:	48 8b 35 97 35 20 00 	mov    0x203597(%rip),%rsi        # 605170 <lab>
  401bd9:	bf a5 30 40 00       	mov    $0x4030a5,%edi
  401bde:	b8 00 00 00 00       	mov    $0x0,%eax
  401be3:	e8 98 f0 ff ff       	callq  400c80 <printf@plt>
  401be8:	48 8d b4 24 10 20 00 	lea    0x2010(%rsp),%rsi
  401bef:	00 
  401bf0:	bf ae 30 40 00       	mov    $0x4030ae,%edi
  401bf5:	b8 00 00 00 00       	mov    $0x0,%eax
  401bfa:	e8 81 f0 ff ff       	callq  400c80 <printf@plt>
  401bff:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401c06:	5b                   	pop    %rbx
  401c07:	f3 c3                	repz retq 

0000000000401c09 <validate>:
  401c09:	53                   	push   %rbx
  401c0a:	89 fb                	mov    %edi,%ebx
  401c0c:	83 3d f5 38 20 00 00 	cmpl   $0x0,0x2038f5(%rip)        # 605508 <is_checker>
  401c13:	74 60                	je     401c75 <validate+0x6c>
  401c15:	39 3d e1 38 20 00    	cmp    %edi,0x2038e1(%rip)        # 6054fc <vlevel>
  401c1b:	74 14                	je     401c31 <validate+0x28>
  401c1d:	bf ba 30 40 00       	mov    $0x4030ba,%edi
  401c22:	e8 29 f0 ff ff       	callq  400c50 <puts@plt>
  401c27:	b8 00 00 00 00       	mov    $0x0,%eax
  401c2c:	e8 ba fd ff ff       	callq  4019eb <check_fail>
  401c31:	8b 35 c1 38 20 00    	mov    0x2038c1(%rip),%esi        # 6054f8 <check_level>
  401c37:	39 fe                	cmp    %edi,%esi
  401c39:	74 1b                	je     401c56 <validate+0x4d>
  401c3b:	89 fa                	mov    %edi,%edx
  401c3d:	bf f8 31 40 00       	mov    $0x4031f8,%edi
  401c42:	b8 00 00 00 00       	mov    $0x0,%eax
  401c47:	e8 34 f0 ff ff       	callq  400c80 <printf@plt>
  401c4c:	b8 00 00 00 00       	mov    $0x0,%eax
  401c51:	e8 95 fd ff ff       	callq  4019eb <check_fail>
  401c56:	0f be 35 cb 44 20 00 	movsbl 0x2044cb(%rip),%esi        # 606128 <target_prefix>
  401c5d:	b9 20 55 60 00       	mov    $0x605520,%ecx
  401c62:	89 fa                	mov    %edi,%edx
  401c64:	bf d8 30 40 00       	mov    $0x4030d8,%edi
  401c69:	b8 00 00 00 00       	mov    $0x0,%eax
  401c6e:	e8 0d f0 ff ff       	callq  400c80 <printf@plt>
  401c73:	eb 44                	jmp    401cb9 <validate+0xb0>
  401c75:	39 3d 81 38 20 00    	cmp    %edi,0x203881(%rip)        # 6054fc <vlevel>
  401c7b:	74 18                	je     401c95 <validate+0x8c>
  401c7d:	bf ba 30 40 00       	mov    $0x4030ba,%edi
  401c82:	e8 c9 ef ff ff       	callq  400c50 <puts@plt>
  401c87:	89 de                	mov    %ebx,%esi
  401c89:	bf 00 00 00 00       	mov    $0x0,%edi
  401c8e:	e8 d9 fd ff ff       	callq  401a6c <notify_server>
  401c93:	eb 24                	jmp    401cb9 <validate+0xb0>
  401c95:	0f be 15 8c 44 20 00 	movsbl 0x20448c(%rip),%edx        # 606128 <target_prefix>
  401c9c:	89 fe                	mov    %edi,%esi
  401c9e:	bf 20 32 40 00       	mov    $0x403220,%edi
  401ca3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca8:	e8 d3 ef ff ff       	callq  400c80 <printf@plt>
  401cad:	89 de                	mov    %ebx,%esi
  401caf:	bf 01 00 00 00       	mov    $0x1,%edi
  401cb4:	e8 b3 fd ff ff       	callq  401a6c <notify_server>
  401cb9:	5b                   	pop    %rbx
  401cba:	c3                   	retq   

0000000000401cbb <fail>:
  401cbb:	48 83 ec 08          	sub    $0x8,%rsp
  401cbf:	83 3d 42 38 20 00 00 	cmpl   $0x0,0x203842(%rip)        # 605508 <is_checker>
  401cc6:	74 0a                	je     401cd2 <fail+0x17>
  401cc8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ccd:	e8 19 fd ff ff       	callq  4019eb <check_fail>
  401cd2:	89 fe                	mov    %edi,%esi
  401cd4:	bf 00 00 00 00       	mov    $0x0,%edi
  401cd9:	e8 8e fd ff ff       	callq  401a6c <notify_server>
  401cde:	48 83 c4 08          	add    $0x8,%rsp
  401ce2:	c3                   	retq   

0000000000401ce3 <bushandler>:
  401ce3:	48 83 ec 08          	sub    $0x8,%rsp
  401ce7:	83 3d 1a 38 20 00 00 	cmpl   $0x0,0x20381a(%rip)        # 605508 <is_checker>
  401cee:	74 14                	je     401d04 <bushandler+0x21>
  401cf0:	bf ed 30 40 00       	mov    $0x4030ed,%edi
  401cf5:	e8 56 ef ff ff       	callq  400c50 <puts@plt>
  401cfa:	b8 00 00 00 00       	mov    $0x0,%eax
  401cff:	e8 e7 fc ff ff       	callq  4019eb <check_fail>
  401d04:	bf 58 32 40 00       	mov    $0x403258,%edi
  401d09:	e8 42 ef ff ff       	callq  400c50 <puts@plt>
  401d0e:	bf f7 30 40 00       	mov    $0x4030f7,%edi
  401d13:	e8 38 ef ff ff       	callq  400c50 <puts@plt>
  401d18:	be 00 00 00 00       	mov    $0x0,%esi
  401d1d:	bf 00 00 00 00       	mov    $0x0,%edi
  401d22:	e8 45 fd ff ff       	callq  401a6c <notify_server>
  401d27:	bf 01 00 00 00       	mov    $0x1,%edi
  401d2c:	e8 bf f0 ff ff       	callq  400df0 <exit@plt>

0000000000401d31 <seghandler>:
  401d31:	48 83 ec 08          	sub    $0x8,%rsp
  401d35:	83 3d cc 37 20 00 00 	cmpl   $0x0,0x2037cc(%rip)        # 605508 <is_checker>
  401d3c:	74 14                	je     401d52 <seghandler+0x21>
  401d3e:	bf 0d 31 40 00       	mov    $0x40310d,%edi
  401d43:	e8 08 ef ff ff       	callq  400c50 <puts@plt>
  401d48:	b8 00 00 00 00       	mov    $0x0,%eax
  401d4d:	e8 99 fc ff ff       	callq  4019eb <check_fail>
  401d52:	bf 78 32 40 00       	mov    $0x403278,%edi
  401d57:	e8 f4 ee ff ff       	callq  400c50 <puts@plt>
  401d5c:	bf f7 30 40 00       	mov    $0x4030f7,%edi
  401d61:	e8 ea ee ff ff       	callq  400c50 <puts@plt>
  401d66:	be 00 00 00 00       	mov    $0x0,%esi
  401d6b:	bf 00 00 00 00       	mov    $0x0,%edi
  401d70:	e8 f7 fc ff ff       	callq  401a6c <notify_server>
  401d75:	bf 01 00 00 00       	mov    $0x1,%edi
  401d7a:	e8 71 f0 ff ff       	callq  400df0 <exit@plt>

0000000000401d7f <illegalhandler>:
  401d7f:	48 83 ec 08          	sub    $0x8,%rsp
  401d83:	83 3d 7e 37 20 00 00 	cmpl   $0x0,0x20377e(%rip)        # 605508 <is_checker>
  401d8a:	74 14                	je     401da0 <illegalhandler+0x21>
  401d8c:	bf 20 31 40 00       	mov    $0x403120,%edi
  401d91:	e8 ba ee ff ff       	callq  400c50 <puts@plt>
  401d96:	b8 00 00 00 00       	mov    $0x0,%eax
  401d9b:	e8 4b fc ff ff       	callq  4019eb <check_fail>
  401da0:	bf a0 32 40 00       	mov    $0x4032a0,%edi
  401da5:	e8 a6 ee ff ff       	callq  400c50 <puts@plt>
  401daa:	bf f7 30 40 00       	mov    $0x4030f7,%edi
  401daf:	e8 9c ee ff ff       	callq  400c50 <puts@plt>
  401db4:	be 00 00 00 00       	mov    $0x0,%esi
  401db9:	bf 00 00 00 00       	mov    $0x0,%edi
  401dbe:	e8 a9 fc ff ff       	callq  401a6c <notify_server>
  401dc3:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc8:	e8 23 f0 ff ff       	callq  400df0 <exit@plt>

0000000000401dcd <sigalrmhandler>:
  401dcd:	48 83 ec 08          	sub    $0x8,%rsp
  401dd1:	83 3d 30 37 20 00 00 	cmpl   $0x0,0x203730(%rip)        # 605508 <is_checker>
  401dd8:	74 14                	je     401dee <sigalrmhandler+0x21>
  401dda:	bf 34 31 40 00       	mov    $0x403134,%edi
  401ddf:	e8 6c ee ff ff       	callq  400c50 <puts@plt>
  401de4:	b8 00 00 00 00       	mov    $0x0,%eax
  401de9:	e8 fd fb ff ff       	callq  4019eb <check_fail>
  401dee:	be 05 00 00 00       	mov    $0x5,%esi
  401df3:	bf d0 32 40 00       	mov    $0x4032d0,%edi
  401df8:	b8 00 00 00 00       	mov    $0x0,%eax
  401dfd:	e8 7e ee ff ff       	callq  400c80 <printf@plt>
  401e02:	be 00 00 00 00       	mov    $0x0,%esi
  401e07:	bf 00 00 00 00       	mov    $0x0,%edi
  401e0c:	e8 5b fc ff ff       	callq  401a6c <notify_server>
  401e11:	bf 01 00 00 00       	mov    $0x1,%edi
  401e16:	e8 d5 ef ff ff       	callq  400df0 <exit@plt>

0000000000401e1b <launch>:
  401e1b:	55                   	push   %rbp
  401e1c:	48 89 e5             	mov    %rsp,%rbp
  401e1f:	48 89 fa             	mov    %rdi,%rdx
  401e22:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401e26:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401e2a:	48 29 c4             	sub    %rax,%rsp
  401e2d:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401e32:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401e36:	be f4 00 00 00       	mov    $0xf4,%esi
  401e3b:	e8 50 ee ff ff       	callq  400c90 <memset@plt>
  401e40:	48 8b 05 79 36 20 00 	mov    0x203679(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401e47:	48 39 05 a2 36 20 00 	cmp    %rax,0x2036a2(%rip)        # 6054f0 <infile>
  401e4e:	75 0f                	jne    401e5f <launch+0x44>
  401e50:	bf 3c 31 40 00       	mov    $0x40313c,%edi
  401e55:	b8 00 00 00 00       	mov    $0x0,%eax
  401e5a:	e8 21 ee ff ff       	callq  400c80 <printf@plt>
  401e5f:	c7 05 93 36 20 00 00 	movl   $0x0,0x203693(%rip)        # 6054fc <vlevel>
  401e66:	00 00 00 
  401e69:	b8 00 00 00 00       	mov    $0x0,%eax
  401e6e:	e8 c7 f9 ff ff       	callq  40183a <test>
  401e73:	83 3d 8e 36 20 00 00 	cmpl   $0x0,0x20368e(%rip)        # 605508 <is_checker>
  401e7a:	74 14                	je     401e90 <launch+0x75>
  401e7c:	bf 49 31 40 00       	mov    $0x403149,%edi
  401e81:	e8 ca ed ff ff       	callq  400c50 <puts@plt>
  401e86:	b8 00 00 00 00       	mov    $0x0,%eax
  401e8b:	e8 5b fb ff ff       	callq  4019eb <check_fail>
  401e90:	bf 54 31 40 00       	mov    $0x403154,%edi
  401e95:	e8 b6 ed ff ff       	callq  400c50 <puts@plt>
  401e9a:	c9                   	leaveq 
  401e9b:	c3                   	retq   

0000000000401e9c <stable_launch>:
  401e9c:	53                   	push   %rbx
  401e9d:	48 89 3d 44 36 20 00 	mov    %rdi,0x203644(%rip)        # 6054e8 <global_offset>
  401ea4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401eaa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401eb0:	b9 32 01 00 00       	mov    $0x132,%ecx
  401eb5:	ba 07 00 00 00       	mov    $0x7,%edx
  401eba:	be 00 00 10 00       	mov    $0x100000,%esi
  401ebf:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401ec4:	e8 a7 ed ff ff       	callq  400c70 <mmap@plt>
  401ec9:	48 89 c3             	mov    %rax,%rbx
  401ecc:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401ed2:	74 32                	je     401f06 <stable_launch+0x6a>
  401ed4:	be 00 00 10 00       	mov    $0x100000,%esi
  401ed9:	48 89 c7             	mov    %rax,%rdi
  401edc:	e8 9f ee ff ff       	callq  400d80 <munmap@plt>
  401ee1:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401ee6:	be 08 33 40 00       	mov    $0x403308,%esi
  401eeb:	48 8b 3d de 35 20 00 	mov    0x2035de(%rip),%rdi        # 6054d0 <stderr@@GLIBC_2.2.5>
  401ef2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef7:	e8 04 ee ff ff       	callq  400d00 <fprintf@plt>
  401efc:	bf 01 00 00 00       	mov    $0x1,%edi
  401f01:	e8 ea ee ff ff       	callq  400df0 <exit@plt>
  401f06:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f0d:	48 89 15 1c 42 20 00 	mov    %rdx,0x20421c(%rip)        # 606130 <stack_top>
  401f14:	48 89 e0             	mov    %rsp,%rax
  401f17:	48 89 d4             	mov    %rdx,%rsp
  401f1a:	48 89 c2             	mov    %rax,%rdx
  401f1d:	48 89 15 bc 35 20 00 	mov    %rdx,0x2035bc(%rip)        # 6054e0 <global_save_stack>
  401f24:	48 8b 3d bd 35 20 00 	mov    0x2035bd(%rip),%rdi        # 6054e8 <global_offset>
  401f2b:	e8 eb fe ff ff       	callq  401e1b <launch>
  401f30:	48 8b 05 a9 35 20 00 	mov    0x2035a9(%rip),%rax        # 6054e0 <global_save_stack>
  401f37:	48 89 c4             	mov    %rax,%rsp
  401f3a:	be 00 00 10 00       	mov    $0x100000,%esi
  401f3f:	48 89 df             	mov    %rbx,%rdi
  401f42:	e8 39 ee ff ff       	callq  400d80 <munmap@plt>
  401f47:	5b                   	pop    %rbx
  401f48:	c3                   	retq   
  401f49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401f50 <rio_readinitb>:
  401f50:	89 37                	mov    %esi,(%rdi)
  401f52:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401f59:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401f5d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401f61:	c3                   	retq   

0000000000401f62 <sigalrm_handler>:
  401f62:	48 83 ec 08          	sub    $0x8,%rsp
  401f66:	ba 00 00 00 00       	mov    $0x0,%edx
  401f6b:	be 40 33 40 00       	mov    $0x403340,%esi
  401f70:	48 8b 3d 59 35 20 00 	mov    0x203559(%rip),%rdi        # 6054d0 <stderr@@GLIBC_2.2.5>
  401f77:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7c:	e8 7f ed ff ff       	callq  400d00 <fprintf@plt>
  401f81:	bf 01 00 00 00       	mov    $0x1,%edi
  401f86:	e8 65 ee ff ff       	callq  400df0 <exit@plt>

0000000000401f8b <urlencode>:
  401f8b:	41 54                	push   %r12
  401f8d:	55                   	push   %rbp
  401f8e:	53                   	push   %rbx
  401f8f:	48 83 ec 10          	sub    $0x10,%rsp
  401f93:	48 89 fb             	mov    %rdi,%rbx
  401f96:	48 89 f5             	mov    %rsi,%rbp
  401f99:	b8 00 00 00 00       	mov    $0x0,%eax
  401f9e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401fa5:	f2 ae                	repnz scas %es:(%rdi),%al
  401fa7:	48 f7 d1             	not    %rcx
  401faa:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401fad:	e9 93 00 00 00       	jmpq   402045 <urlencode+0xba>
  401fb2:	0f b6 13             	movzbl (%rbx),%edx
  401fb5:	80 fa 2a             	cmp    $0x2a,%dl
  401fb8:	0f 94 c1             	sete   %cl
  401fbb:	80 fa 2d             	cmp    $0x2d,%dl
  401fbe:	0f 94 c0             	sete   %al
  401fc1:	08 c1                	or     %al,%cl
  401fc3:	75 1f                	jne    401fe4 <urlencode+0x59>
  401fc5:	80 fa 2e             	cmp    $0x2e,%dl
  401fc8:	74 1a                	je     401fe4 <urlencode+0x59>
  401fca:	80 fa 5f             	cmp    $0x5f,%dl
  401fcd:	74 15                	je     401fe4 <urlencode+0x59>
  401fcf:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401fd2:	3c 09                	cmp    $0x9,%al
  401fd4:	76 0e                	jbe    401fe4 <urlencode+0x59>
  401fd6:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401fd9:	3c 19                	cmp    $0x19,%al
  401fdb:	76 07                	jbe    401fe4 <urlencode+0x59>
  401fdd:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401fe0:	3c 19                	cmp    $0x19,%al
  401fe2:	77 09                	ja     401fed <urlencode+0x62>
  401fe4:	88 55 00             	mov    %dl,0x0(%rbp)
  401fe7:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401feb:	eb 51                	jmp    40203e <urlencode+0xb3>
  401fed:	80 fa 20             	cmp    $0x20,%dl
  401ff0:	75 0a                	jne    401ffc <urlencode+0x71>
  401ff2:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401ff6:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401ffa:	eb 42                	jmp    40203e <urlencode+0xb3>
  401ffc:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401fff:	3c 5f                	cmp    $0x5f,%al
  402001:	0f 96 c1             	setbe  %cl
  402004:	80 fa 09             	cmp    $0x9,%dl
  402007:	0f 94 c0             	sete   %al
  40200a:	08 c1                	or     %al,%cl
  40200c:	74 45                	je     402053 <urlencode+0xc8>
  40200e:	0f b6 d2             	movzbl %dl,%edx
  402011:	be d8 33 40 00       	mov    $0x4033d8,%esi
  402016:	48 89 e7             	mov    %rsp,%rdi
  402019:	b8 00 00 00 00       	mov    $0x0,%eax
  40201e:	e8 bd ed ff ff       	callq  400de0 <sprintf@plt>
  402023:	0f b6 04 24          	movzbl (%rsp),%eax
  402027:	88 45 00             	mov    %al,0x0(%rbp)
  40202a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40202f:	88 45 01             	mov    %al,0x1(%rbp)
  402032:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402037:	88 45 02             	mov    %al,0x2(%rbp)
  40203a:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40203e:	48 83 c3 01          	add    $0x1,%rbx
  402042:	44 89 e0             	mov    %r12d,%eax
  402045:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402049:	85 c0                	test   %eax,%eax
  40204b:	0f 85 61 ff ff ff    	jne    401fb2 <urlencode+0x27>
  402051:	eb 05                	jmp    402058 <urlencode+0xcd>
  402053:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402058:	48 83 c4 10          	add    $0x10,%rsp
  40205c:	5b                   	pop    %rbx
  40205d:	5d                   	pop    %rbp
  40205e:	41 5c                	pop    %r12
  402060:	c3                   	retq   

0000000000402061 <rio_writen>:
  402061:	41 55                	push   %r13
  402063:	41 54                	push   %r12
  402065:	55                   	push   %rbp
  402066:	53                   	push   %rbx
  402067:	48 83 ec 08          	sub    $0x8,%rsp
  40206b:	41 89 fc             	mov    %edi,%r12d
  40206e:	48 89 f5             	mov    %rsi,%rbp
  402071:	49 89 d5             	mov    %rdx,%r13
  402074:	48 89 d3             	mov    %rdx,%rbx
  402077:	eb 28                	jmp    4020a1 <rio_writen+0x40>
  402079:	48 89 da             	mov    %rbx,%rdx
  40207c:	48 89 ee             	mov    %rbp,%rsi
  40207f:	44 89 e7             	mov    %r12d,%edi
  402082:	e8 d9 eb ff ff       	callq  400c60 <write@plt>
  402087:	48 85 c0             	test   %rax,%rax
  40208a:	7f 0f                	jg     40209b <rio_writen+0x3a>
  40208c:	e8 7f eb ff ff       	callq  400c10 <__errno_location@plt>
  402091:	83 38 04             	cmpl   $0x4,(%rax)
  402094:	75 15                	jne    4020ab <rio_writen+0x4a>
  402096:	b8 00 00 00 00       	mov    $0x0,%eax
  40209b:	48 29 c3             	sub    %rax,%rbx
  40209e:	48 01 c5             	add    %rax,%rbp
  4020a1:	48 85 db             	test   %rbx,%rbx
  4020a4:	75 d3                	jne    402079 <rio_writen+0x18>
  4020a6:	4c 89 e8             	mov    %r13,%rax
  4020a9:	eb 07                	jmp    4020b2 <rio_writen+0x51>
  4020ab:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4020b2:	48 83 c4 08          	add    $0x8,%rsp
  4020b6:	5b                   	pop    %rbx
  4020b7:	5d                   	pop    %rbp
  4020b8:	41 5c                	pop    %r12
  4020ba:	41 5d                	pop    %r13
  4020bc:	c3                   	retq   

00000000004020bd <rio_read>:
  4020bd:	41 56                	push   %r14
  4020bf:	41 55                	push   %r13
  4020c1:	41 54                	push   %r12
  4020c3:	55                   	push   %rbp
  4020c4:	53                   	push   %rbx
  4020c5:	48 89 fb             	mov    %rdi,%rbx
  4020c8:	49 89 f6             	mov    %rsi,%r14
  4020cb:	49 89 d5             	mov    %rdx,%r13
  4020ce:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4020d2:	eb 2a                	jmp    4020fe <rio_read+0x41>
  4020d4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020d9:	4c 89 e6             	mov    %r12,%rsi
  4020dc:	8b 3b                	mov    (%rbx),%edi
  4020de:	e8 dd eb ff ff       	callq  400cc0 <read@plt>
  4020e3:	89 43 04             	mov    %eax,0x4(%rbx)
  4020e6:	85 c0                	test   %eax,%eax
  4020e8:	79 0c                	jns    4020f6 <rio_read+0x39>
  4020ea:	e8 21 eb ff ff       	callq  400c10 <__errno_location@plt>
  4020ef:	83 38 04             	cmpl   $0x4,(%rax)
  4020f2:	74 0a                	je     4020fe <rio_read+0x41>
  4020f4:	eb 37                	jmp    40212d <rio_read+0x70>
  4020f6:	85 c0                	test   %eax,%eax
  4020f8:	74 3c                	je     402136 <rio_read+0x79>
  4020fa:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4020fe:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402101:	85 ed                	test   %ebp,%ebp
  402103:	7e cf                	jle    4020d4 <rio_read+0x17>
  402105:	89 e8                	mov    %ebp,%eax
  402107:	4c 39 e8             	cmp    %r13,%rax
  40210a:	72 03                	jb     40210f <rio_read+0x52>
  40210c:	44 89 ed             	mov    %r13d,%ebp
  40210f:	4c 63 e5             	movslq %ebp,%r12
  402112:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402116:	4c 89 e2             	mov    %r12,%rdx
  402119:	4c 89 f7             	mov    %r14,%rdi
  40211c:	e8 0f ec ff ff       	callq  400d30 <memcpy@plt>
  402121:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402125:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402128:	4c 89 e0             	mov    %r12,%rax
  40212b:	eb 0e                	jmp    40213b <rio_read+0x7e>
  40212d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402134:	eb 05                	jmp    40213b <rio_read+0x7e>
  402136:	b8 00 00 00 00       	mov    $0x0,%eax
  40213b:	5b                   	pop    %rbx
  40213c:	5d                   	pop    %rbp
  40213d:	41 5c                	pop    %r12
  40213f:	41 5d                	pop    %r13
  402141:	41 5e                	pop    %r14
  402143:	c3                   	retq   

0000000000402144 <rio_readlineb>:
  402144:	41 55                	push   %r13
  402146:	41 54                	push   %r12
  402148:	55                   	push   %rbp
  402149:	53                   	push   %rbx
  40214a:	48 83 ec 18          	sub    $0x18,%rsp
  40214e:	49 89 fd             	mov    %rdi,%r13
  402151:	48 89 f5             	mov    %rsi,%rbp
  402154:	49 89 d4             	mov    %rdx,%r12
  402157:	bb 01 00 00 00       	mov    $0x1,%ebx
  40215c:	eb 3d                	jmp    40219b <rio_readlineb+0x57>
  40215e:	ba 01 00 00 00       	mov    $0x1,%edx
  402163:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402168:	4c 89 ef             	mov    %r13,%rdi
  40216b:	e8 4d ff ff ff       	callq  4020bd <rio_read>
  402170:	83 f8 01             	cmp    $0x1,%eax
  402173:	75 12                	jne    402187 <rio_readlineb+0x43>
  402175:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  402179:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  40217e:	88 45 00             	mov    %al,0x0(%rbp)
  402181:	3c 0a                	cmp    $0xa,%al
  402183:	75 0f                	jne    402194 <rio_readlineb+0x50>
  402185:	eb 1b                	jmp    4021a2 <rio_readlineb+0x5e>
  402187:	85 c0                	test   %eax,%eax
  402189:	75 23                	jne    4021ae <rio_readlineb+0x6a>
  40218b:	48 83 fb 01          	cmp    $0x1,%rbx
  40218f:	90                   	nop
  402190:	75 13                	jne    4021a5 <rio_readlineb+0x61>
  402192:	eb 23                	jmp    4021b7 <rio_readlineb+0x73>
  402194:	48 83 c3 01          	add    $0x1,%rbx
  402198:	48 89 d5             	mov    %rdx,%rbp
  40219b:	4c 39 e3             	cmp    %r12,%rbx
  40219e:	72 be                	jb     40215e <rio_readlineb+0x1a>
  4021a0:	eb 03                	jmp    4021a5 <rio_readlineb+0x61>
  4021a2:	48 89 d5             	mov    %rdx,%rbp
  4021a5:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4021a9:	48 89 d8             	mov    %rbx,%rax
  4021ac:	eb 0e                	jmp    4021bc <rio_readlineb+0x78>
  4021ae:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021b5:	eb 05                	jmp    4021bc <rio_readlineb+0x78>
  4021b7:	b8 00 00 00 00       	mov    $0x0,%eax
  4021bc:	48 83 c4 18          	add    $0x18,%rsp
  4021c0:	5b                   	pop    %rbx
  4021c1:	5d                   	pop    %rbp
  4021c2:	41 5c                	pop    %r12
  4021c4:	41 5d                	pop    %r13
  4021c6:	c3                   	retq   

00000000004021c7 <submitr>:
  4021c7:	41 57                	push   %r15
  4021c9:	41 56                	push   %r14
  4021cb:	41 55                	push   %r13
  4021cd:	41 54                	push   %r12
  4021cf:	55                   	push   %rbp
  4021d0:	53                   	push   %rbx
  4021d1:	48 81 ec 48 a0 00 00 	sub    $0xa048,%rsp
  4021d8:	49 89 fc             	mov    %rdi,%r12
  4021db:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4021df:	49 89 d7             	mov    %rdx,%r15
  4021e2:	49 89 ce             	mov    %rcx,%r14
  4021e5:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4021ea:	4d 89 cd             	mov    %r9,%r13
  4021ed:	48 8b 9c 24 80 a0 00 	mov    0xa080(%rsp),%rbx
  4021f4:	00 
  4021f5:	c7 84 24 1c 20 00 00 	movl   $0x0,0x201c(%rsp)
  4021fc:	00 00 00 00 
  402200:	ba 00 00 00 00       	mov    $0x0,%edx
  402205:	be 01 00 00 00       	mov    $0x1,%esi
  40220a:	bf 02 00 00 00       	mov    $0x2,%edi
  40220f:	e8 fc eb ff ff       	callq  400e10 <socket@plt>
  402214:	89 c5                	mov    %eax,%ebp
  402216:	85 c0                	test   %eax,%eax
  402218:	79 4e                	jns    402268 <submitr+0xa1>
  40221a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402221:	3a 20 43 
  402224:	48 89 03             	mov    %rax,(%rbx)
  402227:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40222e:	20 75 6e 
  402231:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402235:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40223c:	74 6f 20 
  40223f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402243:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40224a:	65 20 73 
  40224d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402251:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402258:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40225e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402263:	e9 68 06 00 00       	jmpq   4028d0 <submitr+0x709>
  402268:	4c 89 e7             	mov    %r12,%rdi
  40226b:	e8 80 ea ff ff       	callq  400cf0 <gethostbyname@plt>
  402270:	48 85 c0             	test   %rax,%rax
  402273:	75 67                	jne    4022dc <submitr+0x115>
  402275:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40227c:	3a 20 44 
  40227f:	48 89 03             	mov    %rax,(%rbx)
  402282:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402289:	20 75 6e 
  40228c:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402290:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402297:	74 6f 20 
  40229a:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40229e:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4022a5:	76 65 20 
  4022a8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4022ac:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4022b3:	72 20 61 
  4022b6:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4022ba:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4022c1:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4022c7:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4022cb:	89 ef                	mov    %ebp,%edi
  4022cd:	e8 de e9 ff ff       	callq  400cb0 <close@plt>
  4022d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022d7:	e9 f4 05 00 00       	jmpq   4028d0 <submitr+0x709>
  4022dc:	48 c7 84 24 30 a0 00 	movq   $0x0,0xa030(%rsp)
  4022e3:	00 00 00 00 00 
  4022e8:	48 c7 84 24 38 a0 00 	movq   $0x0,0xa038(%rsp)
  4022ef:	00 00 00 00 00 
  4022f4:	66 c7 84 24 30 a0 00 	movw   $0x2,0xa030(%rsp)
  4022fb:	00 02 00 
  4022fe:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402302:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402306:	48 8d b4 24 34 a0 00 	lea    0xa034(%rsp),%rsi
  40230d:	00 
  40230e:	48 8b 39             	mov    (%rcx),%rdi
  402311:	e8 7a ea ff ff       	callq  400d90 <bcopy@plt>
  402316:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  40231b:	66 c1 c8 08          	ror    $0x8,%ax
  40231f:	66 89 84 24 32 a0 00 	mov    %ax,0xa032(%rsp)
  402326:	00 
  402327:	ba 10 00 00 00       	mov    $0x10,%edx
  40232c:	48 8d b4 24 30 a0 00 	lea    0xa030(%rsp),%rsi
  402333:	00 
  402334:	89 ef                	mov    %ebp,%edi
  402336:	e8 c5 ea ff ff       	callq  400e00 <connect@plt>
  40233b:	85 c0                	test   %eax,%eax
  40233d:	79 59                	jns    402398 <submitr+0x1d1>
  40233f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402346:	3a 20 55 
  402349:	48 89 03             	mov    %rax,(%rbx)
  40234c:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402353:	20 74 6f 
  402356:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40235a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402361:	65 63 74 
  402364:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402368:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40236f:	68 65 20 
  402372:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402376:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40237d:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402383:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402387:	89 ef                	mov    %ebp,%edi
  402389:	e8 22 e9 ff ff       	callq  400cb0 <close@plt>
  40238e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402393:	e9 38 05 00 00       	jmpq   4028d0 <submitr+0x709>
  402398:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40239f:	4c 89 ef             	mov    %r13,%rdi
  4023a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4023a7:	48 89 d1             	mov    %rdx,%rcx
  4023aa:	f2 ae                	repnz scas %es:(%rdi),%al
  4023ac:	48 f7 d1             	not    %rcx
  4023af:	48 89 ce             	mov    %rcx,%rsi
  4023b2:	4c 89 ff             	mov    %r15,%rdi
  4023b5:	48 89 d1             	mov    %rdx,%rcx
  4023b8:	f2 ae                	repnz scas %es:(%rdi),%al
  4023ba:	48 f7 d1             	not    %rcx
  4023bd:	49 89 c8             	mov    %rcx,%r8
  4023c0:	4c 89 f7             	mov    %r14,%rdi
  4023c3:	48 89 d1             	mov    %rdx,%rcx
  4023c6:	f2 ae                	repnz scas %es:(%rdi),%al
  4023c8:	49 29 c8             	sub    %rcx,%r8
  4023cb:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4023d0:	48 89 d1             	mov    %rdx,%rcx
  4023d3:	f2 ae                	repnz scas %es:(%rdi),%al
  4023d5:	49 29 c8             	sub    %rcx,%r8
  4023d8:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  4023dd:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  4023e2:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4023e8:	76 72                	jbe    40245c <submitr+0x295>
  4023ea:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4023f1:	3a 20 52 
  4023f4:	48 89 03             	mov    %rax,(%rbx)
  4023f7:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4023fe:	20 73 74 
  402401:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402405:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40240c:	74 6f 6f 
  40240f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402413:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40241a:	65 2e 20 
  40241d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402421:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402428:	61 73 65 
  40242b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40242f:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402436:	49 54 52 
  402439:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40243d:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402444:	55 46 00 
  402447:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40244b:	89 ef                	mov    %ebp,%edi
  40244d:	e8 5e e8 ff ff       	callq  400cb0 <close@plt>
  402452:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402457:	e9 74 04 00 00       	jmpq   4028d0 <submitr+0x709>
  40245c:	48 8d b4 24 20 40 00 	lea    0x4020(%rsp),%rsi
  402463:	00 
  402464:	b9 00 04 00 00       	mov    $0x400,%ecx
  402469:	b8 00 00 00 00       	mov    $0x0,%eax
  40246e:	48 89 f7             	mov    %rsi,%rdi
  402471:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402474:	4c 89 ef             	mov    %r13,%rdi
  402477:	e8 0f fb ff ff       	callq  401f8b <urlencode>
  40247c:	85 c0                	test   %eax,%eax
  40247e:	0f 89 8a 00 00 00    	jns    40250e <submitr+0x347>
  402484:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40248b:	3a 20 52 
  40248e:	48 89 03             	mov    %rax,(%rbx)
  402491:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402498:	20 73 74 
  40249b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40249f:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4024a6:	63 6f 6e 
  4024a9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024ad:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4024b4:	20 61 6e 
  4024b7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024bb:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4024c2:	67 61 6c 
  4024c5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024c9:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4024d0:	6e 70 72 
  4024d3:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4024d7:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4024de:	6c 65 20 
  4024e1:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4024e5:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4024ec:	63 74 65 
  4024ef:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4024f3:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4024f9:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4024fd:	89 ef                	mov    %ebp,%edi
  4024ff:	e8 ac e7 ff ff       	callq  400cb0 <close@plt>
  402504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402509:	e9 c2 03 00 00       	jmpq   4028d0 <submitr+0x709>
  40250e:	4d 89 e1             	mov    %r12,%r9
  402511:	4c 8d 84 24 20 40 00 	lea    0x4020(%rsp),%r8
  402518:	00 
  402519:	4c 89 f9             	mov    %r15,%rcx
  40251c:	4c 89 f2             	mov    %r14,%rdx
  40251f:	be 68 33 40 00       	mov    $0x403368,%esi
  402524:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  40252b:	00 
  40252c:	b8 00 00 00 00       	mov    $0x0,%eax
  402531:	e8 aa e8 ff ff       	callq  400de0 <sprintf@plt>
  402536:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  40253d:	00 
  40253e:	b8 00 00 00 00       	mov    $0x0,%eax
  402543:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40254a:	f2 ae                	repnz scas %es:(%rdi),%al
  40254c:	48 f7 d1             	not    %rcx
  40254f:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402553:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  40255a:	00 
  40255b:	89 ef                	mov    %ebp,%edi
  40255d:	e8 ff fa ff ff       	callq  402061 <rio_writen>
  402562:	48 85 c0             	test   %rax,%rax
  402565:	79 6e                	jns    4025d5 <submitr+0x40e>
  402567:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40256e:	3a 20 43 
  402571:	48 89 03             	mov    %rax,(%rbx)
  402574:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40257b:	20 75 6e 
  40257e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402582:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402589:	74 6f 20 
  40258c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402590:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402597:	20 74 6f 
  40259a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40259e:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4025a5:	72 65 73 
  4025a8:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025ac:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4025b3:	65 72 76 
  4025b6:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025ba:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4025c0:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4025c4:	89 ef                	mov    %ebp,%edi
  4025c6:	e8 e5 e6 ff ff       	callq  400cb0 <close@plt>
  4025cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025d0:	e9 fb 02 00 00       	jmpq   4028d0 <submitr+0x709>
  4025d5:	89 ee                	mov    %ebp,%esi
  4025d7:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  4025de:	00 
  4025df:	e8 6c f9 ff ff       	callq  401f50 <rio_readinitb>
  4025e4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4025e9:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  4025f0:	00 
  4025f1:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  4025f8:	00 
  4025f9:	e8 46 fb ff ff       	callq  402144 <rio_readlineb>
  4025fe:	48 85 c0             	test   %rax,%rax
  402601:	7f 7d                	jg     402680 <submitr+0x4b9>
  402603:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40260a:	3a 20 43 
  40260d:	48 89 03             	mov    %rax,(%rbx)
  402610:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402617:	20 75 6e 
  40261a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40261e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402625:	74 6f 20 
  402628:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40262c:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402633:	66 69 72 
  402636:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40263a:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402641:	61 64 65 
  402644:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402648:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  40264f:	6d 20 72 
  402652:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402656:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  40265d:	20 73 65 
  402660:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402664:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40266b:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  40266f:	89 ef                	mov    %ebp,%edi
  402671:	e8 3a e6 ff ff       	callq  400cb0 <close@plt>
  402676:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40267b:	e9 50 02 00 00       	jmpq   4028d0 <submitr+0x709>
  402680:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  402685:	48 8d 8c 24 1c 20 00 	lea    0x201c(%rsp),%rcx
  40268c:	00 
  40268d:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  402694:	00 
  402695:	be df 33 40 00       	mov    $0x4033df,%esi
  40269a:	48 8d bc 24 20 60 00 	lea    0x6020(%rsp),%rdi
  4026a1:	00 
  4026a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4026a7:	e8 c4 e6 ff ff       	callq  400d70 <__isoc99_sscanf@plt>
  4026ac:	e9 98 00 00 00       	jmpq   402749 <submitr+0x582>
  4026b1:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026b6:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  4026bd:	00 
  4026be:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  4026c5:	00 
  4026c6:	e8 79 fa ff ff       	callq  402144 <rio_readlineb>
  4026cb:	48 85 c0             	test   %rax,%rax
  4026ce:	7f 79                	jg     402749 <submitr+0x582>
  4026d0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026d7:	3a 20 43 
  4026da:	48 89 03             	mov    %rax,(%rbx)
  4026dd:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4026e4:	20 75 6e 
  4026e7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026eb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4026f2:	74 6f 20 
  4026f5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026f9:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402700:	68 65 61 
  402703:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402707:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  40270e:	66 72 6f 
  402711:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402715:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40271c:	20 72 65 
  40271f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402723:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  40272a:	73 65 72 
  40272d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402731:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402738:	89 ef                	mov    %ebp,%edi
  40273a:	e8 71 e5 ff ff       	callq  400cb0 <close@plt>
  40273f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402744:	e9 87 01 00 00       	jmpq   4028d0 <submitr+0x709>
  402749:	0f b6 84 24 20 60 00 	movzbl 0x6020(%rsp),%eax
  402750:	00 
  402751:	83 e8 0d             	sub    $0xd,%eax
  402754:	75 15                	jne    40276b <submitr+0x5a4>
  402756:	0f b6 84 24 21 60 00 	movzbl 0x6021(%rsp),%eax
  40275d:	00 
  40275e:	83 e8 0a             	sub    $0xa,%eax
  402761:	75 08                	jne    40276b <submitr+0x5a4>
  402763:	0f b6 84 24 22 60 00 	movzbl 0x6022(%rsp),%eax
  40276a:	00 
  40276b:	85 c0                	test   %eax,%eax
  40276d:	0f 85 3e ff ff ff    	jne    4026b1 <submitr+0x4ea>
  402773:	ba 00 20 00 00       	mov    $0x2000,%edx
  402778:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  40277f:	00 
  402780:	48 8d bc 24 20 80 00 	lea    0x8020(%rsp),%rdi
  402787:	00 
  402788:	e8 b7 f9 ff ff       	callq  402144 <rio_readlineb>
  40278d:	48 85 c0             	test   %rax,%rax
  402790:	0f 8f 83 00 00 00    	jg     402819 <submitr+0x652>
  402796:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40279d:	3a 20 43 
  4027a0:	48 89 03             	mov    %rax,(%rbx)
  4027a3:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027aa:	20 75 6e 
  4027ad:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027b1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027b8:	74 6f 20 
  4027bb:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027bf:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4027c6:	73 74 61 
  4027c9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027cd:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4027d4:	65 73 73 
  4027d7:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027db:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4027e2:	72 6f 6d 
  4027e5:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027e9:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4027f0:	6c 74 20 
  4027f3:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027f7:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  4027fe:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402804:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402808:	89 ef                	mov    %ebp,%edi
  40280a:	e8 a1 e4 ff ff       	callq  400cb0 <close@plt>
  40280f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402814:	e9 b7 00 00 00       	jmpq   4028d0 <submitr+0x709>
  402819:	8b 94 24 1c 20 00 00 	mov    0x201c(%rsp),%edx
  402820:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402826:	74 28                	je     402850 <submitr+0x689>
  402828:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  40282d:	be a8 33 40 00       	mov    $0x4033a8,%esi
  402832:	48 89 df             	mov    %rbx,%rdi
  402835:	b8 00 00 00 00       	mov    $0x0,%eax
  40283a:	e8 a1 e5 ff ff       	callq  400de0 <sprintf@plt>
  40283f:	89 ef                	mov    %ebp,%edi
  402841:	e8 6a e4 ff ff       	callq  400cb0 <close@plt>
  402846:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40284b:	e9 80 00 00 00       	jmpq   4028d0 <submitr+0x709>
  402850:	48 8d b4 24 20 60 00 	lea    0x6020(%rsp),%rsi
  402857:	00 
  402858:	48 89 df             	mov    %rbx,%rdi
  40285b:	e8 e0 e3 ff ff       	callq  400c40 <strcpy@plt>
  402860:	89 ef                	mov    %ebp,%edi
  402862:	e8 49 e4 ff ff       	callq  400cb0 <close@plt>
  402867:	0f b6 03             	movzbl (%rbx),%eax
  40286a:	83 e8 4f             	sub    $0x4f,%eax
  40286d:	75 18                	jne    402887 <submitr+0x6c0>
  40286f:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  402873:	83 ea 4b             	sub    $0x4b,%edx
  402876:	75 11                	jne    402889 <submitr+0x6c2>
  402878:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  40287c:	83 ea 0a             	sub    $0xa,%edx
  40287f:	75 08                	jne    402889 <submitr+0x6c2>
  402881:	0f b6 53 03          	movzbl 0x3(%rbx),%edx
  402885:	eb 02                	jmp    402889 <submitr+0x6c2>
  402887:	89 c2                	mov    %eax,%edx
  402889:	85 d2                	test   %edx,%edx
  40288b:	74 30                	je     4028bd <submitr+0x6f6>
  40288d:	bf f0 33 40 00       	mov    $0x4033f0,%edi
  402892:	b9 05 00 00 00       	mov    $0x5,%ecx
  402897:	48 89 de             	mov    %rbx,%rsi
  40289a:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40289c:	0f 97 c1             	seta   %cl
  40289f:	0f 92 c2             	setb   %dl
  4028a2:	38 d1                	cmp    %dl,%cl
  4028a4:	74 1e                	je     4028c4 <submitr+0x6fd>
  4028a6:	85 c0                	test   %eax,%eax
  4028a8:	75 0d                	jne    4028b7 <submitr+0x6f0>
  4028aa:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  4028ae:	83 e8 4b             	sub    $0x4b,%eax
  4028b1:	75 04                	jne    4028b7 <submitr+0x6f0>
  4028b3:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  4028b7:	85 c0                	test   %eax,%eax
  4028b9:	75 10                	jne    4028cb <submitr+0x704>
  4028bb:	eb 13                	jmp    4028d0 <submitr+0x709>
  4028bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4028c2:	eb 0c                	jmp    4028d0 <submitr+0x709>
  4028c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4028c9:	eb 05                	jmp    4028d0 <submitr+0x709>
  4028cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028d0:	48 81 c4 48 a0 00 00 	add    $0xa048,%rsp
  4028d7:	5b                   	pop    %rbx
  4028d8:	5d                   	pop    %rbp
  4028d9:	41 5c                	pop    %r12
  4028db:	41 5d                	pop    %r13
  4028dd:	41 5e                	pop    %r14
  4028df:	41 5f                	pop    %r15
  4028e1:	c3                   	retq   

00000000004028e2 <init_timeout>:
  4028e2:	53                   	push   %rbx
  4028e3:	89 fb                	mov    %edi,%ebx
  4028e5:	85 ff                	test   %edi,%edi
  4028e7:	74 1f                	je     402908 <init_timeout+0x26>
  4028e9:	85 ff                	test   %edi,%edi
  4028eb:	79 05                	jns    4028f2 <init_timeout+0x10>
  4028ed:	bb 00 00 00 00       	mov    $0x0,%ebx
  4028f2:	be 62 1f 40 00       	mov    $0x401f62,%esi
  4028f7:	bf 0e 00 00 00       	mov    $0xe,%edi
  4028fc:	e8 df e3 ff ff       	callq  400ce0 <signal@plt>
  402901:	89 df                	mov    %ebx,%edi
  402903:	e8 98 e3 ff ff       	callq  400ca0 <alarm@plt>
  402908:	5b                   	pop    %rbx
  402909:	c3                   	retq   

000000000040290a <init_driver>:
  40290a:	55                   	push   %rbp
  40290b:	53                   	push   %rbx
  40290c:	48 83 ec 18          	sub    $0x18,%rsp
  402910:	48 89 fd             	mov    %rdi,%rbp
  402913:	be 01 00 00 00       	mov    $0x1,%esi
  402918:	bf 0d 00 00 00       	mov    $0xd,%edi
  40291d:	e8 be e3 ff ff       	callq  400ce0 <signal@plt>
  402922:	be 01 00 00 00       	mov    $0x1,%esi
  402927:	bf 1d 00 00 00       	mov    $0x1d,%edi
  40292c:	e8 af e3 ff ff       	callq  400ce0 <signal@plt>
  402931:	be 01 00 00 00       	mov    $0x1,%esi
  402936:	bf 1d 00 00 00       	mov    $0x1d,%edi
  40293b:	e8 a0 e3 ff ff       	callq  400ce0 <signal@plt>
  402940:	ba 00 00 00 00       	mov    $0x0,%edx
  402945:	be 01 00 00 00       	mov    $0x1,%esi
  40294a:	bf 02 00 00 00       	mov    $0x2,%edi
  40294f:	e8 bc e4 ff ff       	callq  400e10 <socket@plt>
  402954:	89 c3                	mov    %eax,%ebx
  402956:	85 c0                	test   %eax,%eax
  402958:	79 4f                	jns    4029a9 <init_driver+0x9f>
  40295a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402961:	3a 20 43 
  402964:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402968:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40296f:	20 75 6e 
  402972:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402976:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40297d:	74 6f 20 
  402980:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402984:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40298b:	65 20 73 
  40298e:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402992:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402999:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40299f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029a4:	e9 23 01 00 00       	jmpq   402acc <init_driver+0x1c2>
  4029a9:	bf f5 33 40 00       	mov    $0x4033f5,%edi
  4029ae:	e8 3d e3 ff ff       	callq  400cf0 <gethostbyname@plt>
  4029b3:	48 85 c0             	test   %rax,%rax
  4029b6:	75 68                	jne    402a20 <init_driver+0x116>
  4029b8:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4029bf:	3a 20 44 
  4029c2:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4029c6:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4029cd:	20 75 6e 
  4029d0:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4029d4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029db:	74 6f 20 
  4029de:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029e2:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4029e9:	76 65 20 
  4029ec:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4029f0:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4029f7:	72 20 61 
  4029fa:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4029fe:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402a05:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402a0b:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402a0f:	89 df                	mov    %ebx,%edi
  402a11:	e8 9a e2 ff ff       	callq  400cb0 <close@plt>
  402a16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a1b:	e9 ac 00 00 00       	jmpq   402acc <init_driver+0x1c2>
  402a20:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402a27:	00 
  402a28:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402a2f:	00 00 
  402a31:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402a37:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402a3b:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402a3f:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  402a44:	48 8b 39             	mov    (%rcx),%rdi
  402a47:	e8 44 e3 ff ff       	callq  400d90 <bcopy@plt>
  402a4c:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402a53:	ba 10 00 00 00       	mov    $0x10,%edx
  402a58:	48 89 e6             	mov    %rsp,%rsi
  402a5b:	89 df                	mov    %ebx,%edi
  402a5d:	e8 9e e3 ff ff       	callq  400e00 <connect@plt>
  402a62:	85 c0                	test   %eax,%eax
  402a64:	79 50                	jns    402ab6 <init_driver+0x1ac>
  402a66:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402a6d:	3a 20 55 
  402a70:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a74:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402a7b:	20 74 6f 
  402a7e:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402a82:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402a89:	65 63 74 
  402a8c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a90:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402a97:	65 72 76 
  402a9a:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a9e:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402aa4:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402aa8:	89 df                	mov    %ebx,%edi
  402aaa:	e8 01 e2 ff ff       	callq  400cb0 <close@plt>
  402aaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ab4:	eb 16                	jmp    402acc <init_driver+0x1c2>
  402ab6:	89 df                	mov    %ebx,%edi
  402ab8:	e8 f3 e1 ff ff       	callq  400cb0 <close@plt>
  402abd:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402ac3:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402ac7:	b8 00 00 00 00       	mov    $0x0,%eax
  402acc:	48 83 c4 18          	add    $0x18,%rsp
  402ad0:	5b                   	pop    %rbx
  402ad1:	5d                   	pop    %rbp
  402ad2:	c3                   	retq   

0000000000402ad3 <driver_post>:
  402ad3:	53                   	push   %rbx
  402ad4:	48 83 ec 10          	sub    $0x10,%rsp
  402ad8:	4c 89 cb             	mov    %r9,%rbx
  402adb:	45 85 c0             	test   %r8d,%r8d
  402ade:	74 22                	je     402b02 <driver_post+0x2f>
  402ae0:	48 89 ce             	mov    %rcx,%rsi
  402ae3:	bf 08 34 40 00       	mov    $0x403408,%edi
  402ae8:	b8 00 00 00 00       	mov    $0x0,%eax
  402aed:	e8 8e e1 ff ff       	callq  400c80 <printf@plt>
  402af2:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402af7:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402afb:	b8 00 00 00 00       	mov    $0x0,%eax
  402b00:	eb 39                	jmp    402b3b <driver_post+0x68>
  402b02:	48 85 ff             	test   %rdi,%rdi
  402b05:	74 26                	je     402b2d <driver_post+0x5a>
  402b07:	80 3f 00             	cmpb   $0x0,(%rdi)
  402b0a:	74 21                	je     402b2d <driver_post+0x5a>
  402b0c:	4c 89 0c 24          	mov    %r9,(%rsp)
  402b10:	49 89 c9             	mov    %rcx,%r9
  402b13:	49 89 d0             	mov    %rdx,%r8
  402b16:	48 89 f9             	mov    %rdi,%rcx
  402b19:	48 89 f2             	mov    %rsi,%rdx
  402b1c:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402b21:	bf f5 33 40 00       	mov    $0x4033f5,%edi
  402b26:	e8 9c f6 ff ff       	callq  4021c7 <submitr>
  402b2b:	eb 0e                	jmp    402b3b <driver_post+0x68>
  402b2d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402b32:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402b36:	b8 00 00 00 00       	mov    $0x0,%eax
  402b3b:	48 83 c4 10          	add    $0x10,%rsp
  402b3f:	5b                   	pop    %rbx
  402b40:	c3                   	retq   

0000000000402b41 <check>:
  402b41:	89 f8                	mov    %edi,%eax
  402b43:	c1 e8 1c             	shr    $0x1c,%eax
  402b46:	85 c0                	test   %eax,%eax
  402b48:	74 1d                	je     402b67 <check+0x26>
  402b4a:	b9 00 00 00 00       	mov    $0x0,%ecx
  402b4f:	eb 0b                	jmp    402b5c <check+0x1b>
  402b51:	89 f8                	mov    %edi,%eax
  402b53:	d3 e8                	shr    %cl,%eax
  402b55:	3c 0a                	cmp    $0xa,%al
  402b57:	74 14                	je     402b6d <check+0x2c>
  402b59:	83 c1 08             	add    $0x8,%ecx
  402b5c:	83 f9 1f             	cmp    $0x1f,%ecx
  402b5f:	7e f0                	jle    402b51 <check+0x10>
  402b61:	b8 01 00 00 00       	mov    $0x1,%eax
  402b66:	c3                   	retq   
  402b67:	b8 00 00 00 00       	mov    $0x0,%eax
  402b6c:	c3                   	retq   
  402b6d:	b8 00 00 00 00       	mov    $0x0,%eax
  402b72:	c3                   	retq   

0000000000402b73 <gencookie>:
  402b73:	53                   	push   %rbx
  402b74:	83 c7 01             	add    $0x1,%edi
  402b77:	e8 a4 e0 ff ff       	callq  400c20 <srandom@plt>
  402b7c:	e8 cf e1 ff ff       	callq  400d50 <random@plt>
  402b81:	89 c3                	mov    %eax,%ebx
  402b83:	89 c7                	mov    %eax,%edi
  402b85:	e8 b7 ff ff ff       	callq  402b41 <check>
  402b8a:	85 c0                	test   %eax,%eax
  402b8c:	74 ee                	je     402b7c <gencookie+0x9>
  402b8e:	89 d8                	mov    %ebx,%eax
  402b90:	5b                   	pop    %rbx
  402b91:	c3                   	retq   
  402b92:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402b99:	00 00 00 
  402b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402ba0 <__libc_csu_init>:
  402ba0:	41 57                	push   %r15
  402ba2:	41 89 ff             	mov    %edi,%r15d
  402ba5:	41 56                	push   %r14
  402ba7:	49 89 f6             	mov    %rsi,%r14
  402baa:	41 55                	push   %r13
  402bac:	49 89 d5             	mov    %rdx,%r13
  402baf:	41 54                	push   %r12
  402bb1:	4c 8d 25 58 22 20 00 	lea    0x202258(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  402bb8:	55                   	push   %rbp
  402bb9:	48 8d 2d 58 22 20 00 	lea    0x202258(%rip),%rbp        # 604e18 <__init_array_end>
  402bc0:	53                   	push   %rbx
  402bc1:	4c 29 e5             	sub    %r12,%rbp
  402bc4:	31 db                	xor    %ebx,%ebx
  402bc6:	48 c1 fd 03          	sar    $0x3,%rbp
  402bca:	48 83 ec 08          	sub    $0x8,%rsp
  402bce:	e8 f5 df ff ff       	callq  400bc8 <_init>
  402bd3:	48 85 ed             	test   %rbp,%rbp
  402bd6:	74 1e                	je     402bf6 <__libc_csu_init+0x56>
  402bd8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402bdf:	00 
  402be0:	4c 89 ea             	mov    %r13,%rdx
  402be3:	4c 89 f6             	mov    %r14,%rsi
  402be6:	44 89 ff             	mov    %r15d,%edi
  402be9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402bed:	48 83 c3 01          	add    $0x1,%rbx
  402bf1:	48 39 eb             	cmp    %rbp,%rbx
  402bf4:	75 ea                	jne    402be0 <__libc_csu_init+0x40>
  402bf6:	48 83 c4 08          	add    $0x8,%rsp
  402bfa:	5b                   	pop    %rbx
  402bfb:	5d                   	pop    %rbp
  402bfc:	41 5c                	pop    %r12
  402bfe:	41 5d                	pop    %r13
  402c00:	41 5e                	pop    %r14
  402c02:	41 5f                	pop    %r15
  402c04:	c3                   	retq   
  402c05:	90                   	nop
  402c06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402c0d:	00 00 00 

0000000000402c10 <__libc_csu_fini>:
  402c10:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402c14 <_fini>:
  402c14:	48 83 ec 08          	sub    $0x8,%rsp
  402c18:	48 83 c4 08          	add    $0x8,%rsp
  402c1c:	c3                   	retq   
