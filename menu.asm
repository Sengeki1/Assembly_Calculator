%include 'lib.inc'

section .data
    titulo db LF,'+-----------------------+', LF, '+----- Calculadora -----+', LF, '+-----------------------+', LF, NULL
    obterValor1 db 'Numero1: ', NULL
    obterValor2 db 'Numero2: ',NULL
    op0 db LF, '0 - Sair do Programa', NULL
    qqTecla db LF, '> Ou pressione qualquer tecla para sair do programa', LF, NULL
    op1 db LF, '1 - Adicionar', NULL
    op2 db LF, '2 - Subtrair', NULL
    op3 db LF, '3 - Multiplicar', NULL
    op4 db LF, '4 - Dividir', NULL
    op5 db LF, '> Pressione 1 - Para voltar ao menu principal e Realizar novas operacoes.', LF, NULL

    msgIntroNum db LF, 'Introduza os numeros: ', LF, NULL
    msgOp db LF, 'Escolha a operacao a realizar: ', NULL
    ; msgOpAlt db LF, 'O que mais pretendes fazer?', LF, NULL
    msgError db LF, 'Valor da Opcao invalida', NULL
    p1 db 'Processo de Adicao', NULL
    p2 db 'Processo de Subtracao', NULL
    p3 db 'Processo de Multiplicacao', NULL
    p4 db 'Processo de Divisao', NULL

    result db 'O resultado foi: ', NULL
    msgFim db LF, 'Terminei!!!', LF, NULL

section .bss
    operacao1 RESB 1
    operacao2 RESB 1
    res RESB 1
    valor1 RESB 2
    valor2 RESB 2

section .text

global _start
    _start:

        mov ECX, titulo
        call mostrarSaida

        comecar:
            mov ECX, op0
            call mostrarSaida
            mov ECX, op1
            call mostrarSaida
            mov ECX, op2
            call mostrarSaida
            mov ECX, op3
            call mostrarSaida
            mov ECX, op4
            call mostrarSaida

            mov ECX, msgOp
            call mostrarSaida

        receberEntrada:
            mov ECX, operacao1
            call mostrarEntradaNumero

            movzx AX, byte[operacao1] ; Zero-extend the byte to a word (unsigned)
            sub AX, '0'
            
            cmp AX, 0
            jz exit

            cmp AX, 1
            je adicionar ; jump if equal

            cmp AX, 2
            je subtrair

            cmp AX, 3
            je multiplicar

            cmp AX, 4
            je divisao

            mov ECX, msgError
            call mostrarSaida
            
            jmp escolha

        adicionar:
            mov ECX, p1
            call mostrarSaida
            mov ECX, msgIntroNum
            call mostrarSaida
            
            mov ECX, obterValor1
            call mostrarSaida
            mov ECX, valor1
            call mostrarEntradaNumero
            
            mov ECX, obterValor2
            call mostrarSaida
            mov ECX, valor2
            call mostrarEntradaNumero

            mov AX, [valor1]
            sub AX, '0'

            mov BX, [valor2]
            sub BX, '0'
            
            add AX, BX
            add AX, '0' ; to convert the sum from decimal to ASCII

            mov [res], AX

            mov ECX, result
            call mostrarSaida

            jmp resultado
        
        subtrair:
            mov ECX, p2
            call mostrarSaida
            mov ECX, msgIntroNum
            call mostrarSaida
            
            mov ECX, obterValor1
            call mostrarSaida
            mov ECX, valor1
            call mostrarEntradaNumero
            
            mov ECX, obterValor2
            call mostrarSaida
            mov ECX, valor2
            call mostrarEntradaNumero

            mov AX, [valor1]
            sub AX, '0'

            mov BX, [valor2]
            sub BX, '0'
            
            sub AX, BX
            add AX, '0' ; to convert the sum from decimal to ASCII

            mov [res], AX

            mov ECX, result
            call mostrarSaida

            jmp resultado
        
        multiplicar:
            mov ECX, p3
            call mostrarSaida
            mov ECX, msgIntroNum
            call mostrarSaida
            
            mov ECX, obterValor1
            call mostrarSaida
            mov ECX, valor1
            call mostrarEntradaNumero
            
            mov ECX, obterValor2
            call mostrarSaida
            mov ECX, valor2
            call mostrarEntradaNumero

            mov AX, [valor1]
            sub AX, '0'

            mov BX, [valor2]
            sub BX, '0'
            
            mul BX
            add AX, '0' ; to convert the sum from decimal to ASCII

            mov [res], AX

            mov ECX, result
            call mostrarSaida

            jmp resultado
        
        divisao:
            mov ECX, p4
            call mostrarSaida
            mov ECX, msgIntroNum
            call mostrarSaida
            
            mov ECX, obterValor1
            call mostrarSaida
            mov ECX, valor1
            call mostrarEntradaNumero
            
            mov ECX, obterValor2
            call mostrarSaida
            mov ECX, valor2
            call mostrarEntradaNumero

            mov AL, [valor1]
            sub AL, '0'

            mov BL, [valor2]
            sub BL, '0'
            
            div BL
            add AL, '0' ; to convert the sum from decimal to ASCII

            mov [res], AL

            mov ECX, result
            call mostrarSaida

            jmp resultado

        resultado:
            mov ECX, res
            call mostrarSaidaNumero
        
        escolha:
            mov ECX, op5
            call mostrarSaida
            mov ECX, qqTecla
            call mostrarSaida

            mov ECX, operacao2
            call mostrarEntradaNumero

            movzx AX, byte[operacao2] ; Zero-extend the byte to a word (unsigned)
            sub AX, '0'

            cmp AX, 1
            je comecar

        exit:
            mov ECX, msgFim
            call mostrarSaida

            mov EAX, SYS_EXIT
            mov EBX, RETURN_VALUE
            int SYS_CALL


