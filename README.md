Iterative implementation of fibonacci sequence in x86_64 assembly

Create an executable from fib.asm with nasm
`nasm -f elf64 -o fib.o fib.asm && ld fib.o -o fib`

Then run the executable with integer argument to get the nth number in the fibonacci sequence. ie to get the 93rd fibonacci number

`./fib 93` will print `12200160415121876738`
