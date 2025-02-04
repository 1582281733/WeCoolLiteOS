.set MAGIC, 0x1badb002 
.set FLAGS, (1<<0 | 1<<1) ; GRUB标志块
.set CHECKSUM, -(MAGIC + FLAGS) ; 校验块

; 定义 multiboot段
.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern kernelMain
.global loader

loader:
 mov $kernel_stack, $esp
 push $eax
 push $ebx
 call kernelMain

_stop:
 cli
 hlt
 jmp_stop

.section.bss
.space 2*1024*1024
kernel_stack:

; test
; test2
; test3
