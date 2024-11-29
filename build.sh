#!/bin/bash

mkdir -p bin

nasm -f elf64 src/index.asm -o bin/index.o
nasm -f elf64 src/alloc.asm -o bin/alloc.o
nasm -f elf64 src/free.asm -o bin/free.o
nasm -f elf64 src/realloc.asm -o bin/realloc.o
nasm -f elf64 tests/stress.asm -o bin/stress.o

ld -m elf_x86_64 -o y2am bin/index.o bin/alloc.o bin/free.o bin/realloc.o bin/stress.o