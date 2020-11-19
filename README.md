iterative implementation of fibonacci sequence in x86_64 linux assembly

`nasm -f elf64 -o fib.o fib.asm && ld fib.o -o fib`

then run with integer argument to get the nth number in the fibonacci sequence. ie to get the 93rd fibonacci number

`./fib 93` will print `12200160415121876738`
