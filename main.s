	.text
	.def	_vfscanf_s_l;	.scl	3;	.type	32;	.endef
	.seh_proc	_vfscanf_s_l
_vfscanf_s_l:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	32(%rbp), %r8
	movq	24(%rbp), %rcx
	movq	16(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rdx, 32(%rsp)
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rdx
	movl	$1, %ecx
	call	__stdio_common_vfscanf
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	scanf_s;	.scl	3;	.type	32;	.endef
	.seh_proc	scanf_s
scanf_s:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r9
	movl	$0, %r8d
	movq	%rax, %rdx
	call	_vfscanf_s_l
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	crearNodo
	.def	crearNodo;	.scl	2;	.type	32;	.endef
	.seh_proc	crearNodo
crearNodo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$24, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	24(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	construirArbol
	.def	construirArbol;	.scl	2;	.type	32;	.endef
	.seh_proc	construirArbol
construirArbol:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	40(%rbp), %eax
	cmpl	48(%rbp), %eax
	jge	.L10
	movq	24(%rbp), %rax
	movl	4(%rax), %edx
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	addl	%eax, %edx
	movq	24(%rbp), %rax
	movl	(%rax), %ecx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	call	crearNodo
	movq	16(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	16(%rbp), %rax
	movl	4(%rax), %edx
	movq	32(%rbp), %rax
	movl	4(%rax), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	(%rax), %ecx
	movq	32(%rbp), %rax
	movl	(%rax), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	call	crearNodo
	movq	16(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movl	40(%rbp), %eax
	leal	1(%rax), %r9d
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rbp), %r8
	movq	24(%rbp), %rdx
	movl	48(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	construirArbol
	movl	40(%rbp), %eax
	leal	1(%rax), %r9d
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	32(%rbp), %r8
	movq	16(%rbp), %rdx
	movl	48(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movq	%rax, %rcx
	call	construirArbol
	jmp	.L7
.L10:
	nop
.L7:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%d/%d (Posicion: %d) \0"
	.text
	.globl	mostrarNivel
	.def	mostrarNivel;	.scl	2;	.type	32;	.endef
	.seh_proc	mostrarNivel
mostrarNivel:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L15
	movl	24(%rbp), %eax
	cmpl	32(%rbp), %eax
	jne	.L14
	movq	40(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	40(%rbp), %rax
	movl	%edx, (%rax)
	movq	40(%rbp), %rax
	movl	(%rax), %ecx
	movq	16(%rbp), %rax
	movl	4(%rax), %edx
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L11
.L14:
	movl	24(%rbp), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	40(%rbp), %r8
	movl	32(%rbp), %ecx
	movq	%r8, %r9
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	mostrarNivel
	movl	24(%rbp), %eax
	leal	1(%rax), %edx
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movq	40(%rbp), %r8
	movl	32(%rbp), %ecx
	movq	%r8, %r9
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	mostrarNivel
	jmp	.L11
.L15:
	nop
.L11:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Nivel 0: 0/1 (Posicion: 1) 1/0 (Posicion: 2)\0"
.LC2:
	.ascii "Nivel %d: \0"
	.text
	.globl	imprimirArbol
	.def	imprimirArbol;	.scl	2;	.type	32;	.endef
	.seh_proc	imprimirArbol
imprimirArbol:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -8(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$2, -8(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	leaq	-8(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, %r9
	movl	%ecx, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	mostrarNivel
	movl	$10, %ecx
	call	putchar
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jle	.L18
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	buscarFraccion
	.def	buscarFraccion;	.scl	2;	.type	32;	.endef
	.seh_proc	buscarFraccion
buscarFraccion:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L20
	movl	$-1, %eax
	jmp	.L21
.L20:
	movq	48(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	48(%rbp), %rax
	movl	%edx, (%rax)
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, 24(%rbp)
	jne	.L22
	movq	16(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, 32(%rbp)
	jne	.L22
	movq	48(%rbp), %rax
	movl	(%rax), %edx
	movq	56(%rbp), %rax
	movl	%edx, (%rax)
	movl	40(%rbp), %eax
	jmp	.L21
.L22:
	movl	40(%rbp), %eax
	leal	1(%rax), %r9d
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movl	32(%rbp), %r8d
	movl	24(%rbp), %edx
	movq	56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	buscarFraccion
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L23
	movl	-4(%rbp), %eax
	jmp	.L21
.L23:
	movl	40(%rbp), %eax
	leal	1(%rax), %r9d
	movq	16(%rbp), %rax
	movq	16(%rax), %rax
	movl	32(%rbp), %r8d
	movl	24(%rbp), %edx
	movq	56(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	movq	48(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	buscarFraccion
	movl	%eax, -8(%rbp)
	cmpl	$-1, -8(%rbp)
	je	.L24
	movl	-8(%rbp), %eax
	jmp	.L21
.L24:
	movl	$-1, %eax
.L21:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	inicializarArbol
	.def	inicializarArbol;	.scl	2;	.type	32;	.endef
	.seh_proc	inicializarArbol
inicializarArbol:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$1, %edx
	movl	$1, %ecx
	call	crearNodo
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Ingrese el nivel maximo del arbol (no mayor a 8): \0"
.LC4:
	.ascii "%d\0"
	.align 8
.LC5:
	.ascii "El nivel maximo permitido es 8.\0"
	.align 8
.LC6:
	.ascii "Arbol de Stern-Brocot hasta el nivel %d:\12\0"
	.align 8
.LC7:
	.ascii "\12Ingrese el numerador de la fraccion a buscar (o -1 para salir): \0"
	.align 8
.LC8:
	.ascii "Ingrese el denominador de la fraccion a buscar: \0"
	.align 8
.LC9:
	.ascii "La fraccion 0/1 se encuentra en el nivel 0, posicion 1.\0"
	.align 8
.LC10:
	.ascii "La fraccion 1/0 se encuentra en el nivel 0, posicion 2.\0"
	.align 8
.LC11:
	.ascii "La fraccion %d/%d se encuentra en el nivel %d, posicion %d.\12\0"
	.align 8
.LC12:
	.ascii "La fraccion %d/%d no esta en el arbol.\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	call	__main
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	scanf_s
	movl	-32(%rbp), %eax
	cmpl	$8, %eax
	jle	.L28
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L38
.L28:
	call	inicializarArbol
	movq	%rax, -8(%rbp)
	movl	$1, %edx
	movl	$0, %ecx
	call	crearNodo
	movq	%rax, -16(%rbp)
	movl	$0, %edx
	movl	$1, %ecx
	call	crearNodo
	movq	%rax, -24(%rbp)
	movl	-32(%rbp), %ecx
	movq	-24(%rbp), %r8
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	%ecx, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %rcx
	call	construirArbol
	movl	-32(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	imprimirArbol
.L37:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-36(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	scanf_s
	movl	-36(%rbp), %eax
	cmpl	$-1, %eax
	jne	.L30
	movl	$0, %eax
	jmp	.L38
.L30:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-40(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	scanf_s
	movl	-36(%rbp), %eax
	testl	%eax, %eax
	jne	.L31
	movl	-40(%rbp), %eax
	cmpl	$1, %eax
	jne	.L31
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L36
.L31:
	movl	-36(%rbp), %eax
	cmpl	$1, %eax
	jne	.L33
	movl	-40(%rbp), %eax
	testl	%eax, %eax
	jne	.L33
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L36
.L33:
	movl	$2, -44(%rbp)
	movl	$-1, -48(%rbp)
	movl	-40(%rbp), %r8d
	movl	-36(%rbp), %edx
	movq	-8(%rbp), %rax
	leaq	-48(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	leaq	-44(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movl	$0, %r9d
	movq	%rax, %rcx
	call	buscarFraccion
	movl	%eax, -28(%rbp)
	cmpl	$-1, -28(%rbp)
	je	.L34
	movl	-48(%rbp), %edx
	movl	-28(%rbp), %eax
	leal	1(%rax), %r8d
	movl	-40(%rbp), %ecx
	movl	-36(%rbp), %eax
	movl	%edx, 32(%rsp)
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %edx
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L37
.L34:
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L36:
	jmp	.L37
.L38:
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev3, Built by MSYS2 project) 13.2.0"
	.def	__stdio_common_vfscanf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef


