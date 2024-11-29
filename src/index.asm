section .bss
    heap resb 65536       

section .data
    heap_ptr dd heap
    heap_end dd heap + 65536     

section .text
    global heap, heap_ptr, heap_end, _start
    extern malloc

_start:
    mov rdi, 200
    call malloc

    mov rdi, 20
    call malloc

    mov rdx, rax

    mov rax, 60
    syscall 