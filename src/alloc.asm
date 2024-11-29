%include "include/consts.inc" 
section .text
    global malloc, __malloc_expand_heap
    extern heap, heap_ptr, heap_end

malloc:
    ; rdi - number of bytes to allocate
    ; rax - address of the allocated memory  

    cmp rdi, MIN_ALLOC_SIZE             
    jl __malloc_error_min_alloc_size    

    xor rax, rax
    mov rax, [heap_ptr]                 
    add rax, rdi                        
    ; cmp rax, [heap_end]                 
    ; jge __malloc_expand_heap 
    and rax, 0xFFFFFF8  ; Align rax to the nearest 8-byte boundary

    add rax, META_DATA_SIZE

    mov qword [rax + FREE_FLAG_OFFSET], 0
    mov qword [rax + PREV_PTR_OFFSET], 0
    mov qword [rax + NEXT_PTR_OFFSET], 0

    mov [heap_ptr], rax     

    ret

__malloc_error_min_alloc_size:
    mov rax, 0                         
    ret

__malloc_expand_heap:
    ret
