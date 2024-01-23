segment .data
; Make our own libraries
    LF equ 0xA ; Line Feed (Quebra de Linha)
    NULL equ 0xD ; Carrieage return (Terminar msg com valor nulo)
    SYS_CALL equ 0x80 ; System call (Interruption)

    ; EAX
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4
    SYS_EXIT equ 0x1

    ; EBX
    SDT_OUTPUT equ 0x1
    SDT_INPUT equ 0x0
    RETURN_VALUE equ 0x0

segment .text

mostrarSaida:
    call tamString
    mov EAX, SYS_WRITE
    mov EBX, SDT_OUTPUT
    int SYS_CALL
    ret ; retorna ao ponto em que estava

mostrarEntradaNumero:
    mov EAX, SYS_READ
    mov EBX, SDT_INPUT
    mov EDX, 0xA
    int SYS_CALL
    ret

mostrarSaidaNumero:
    mov EAX, SYS_WRITE
    mov EBX, SDT_OUTPUT
    mov EDX, 0x1
    int SYS_CALL
    ret


tamString:
    mov EDX, ECX

proxChar:
    cmp byte[EDX], NULL; Comparar byte de EDX com null
    jz terminado ; Saltar se for Zerado (Jump Zero) retorna uma flag para o processador caso o registrador receber zero
    ; Caso contrario, incrementar EDX
    inc EDX
    jmp proxChar ;  Salto incondicional para o proximo caracter

terminado: 
    sub EDX, ECX; tirar lixo 
    ret ; Coloca o programa no ponto em que estava
