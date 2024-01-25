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

        mov ECX, titulo ; movemos para ECX porque é o registrador onde
        call mostrarSaida

        comecar:
            mov ECX, op0
            call mostrarSaida ; label criado para fazer o output da mensagem op0 defenido em section .data
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
            call mostrarEntradaNumero ;  label criado para receber o input do utilizador sendo que é uma variavel reservado em section .bss

            movzx AX, byte[operacao1] ; Zero-extend the byte to a word (unsigned) copia o conteudo de um byte e prenche os bits extra com zeros 
            sub AX, '0' ; conversao do caracter numerico para o seu valor atual
            ; sendo o registrador AX onde temos guardado a referencia na memoria da variabel operacao1
            cmp AX, 0 ; comparamos se o valor no registrar é igual 0 
            jz exit ;  se for faz jump zero que se o valor for igual a 0 faz esse jump exclusivo para exit

            cmp AX, 1 ; comparamos se o valor em AX é igual a 1
            je adicionar ; jump if equal, se for igual salta para o label adicionar se n for prossegue o codigo abaixo 

            cmp AX, 2
            je subtrair

            cmp AX, 3
            je multiplicar

            cmp AX, 4
            je divisao

            mov ECX, msgError ; chegando a este ponto significa que o input inserido n foi nenhuma das condicoes acima
            ; entao fazemos o output da mensagem de erro saltando logo para o label escolha
            call mostrarSaida
            
            jmp escolha

        adicionar:
            mov ECX, p1
            call mostrarSaida
            mov ECX, msgIntroNum
            call mostrarSaida
            
            mov ECX, obterValor1
            call mostrarSaida ; Fazemos o display da mensagem primeiro
            mov ECX, valor1 
            call mostrarEntradaNumero ; depois solicitamos o numero que queremos fazer operacaoes com o segundo numero que sera requisita posteriormente
            
            mov ECX, obterValor2
            call mostrarSaida
            mov ECX, valor2
            call mostrarEntradaNumero

            mov AX, [valor1] ; movemos para AX a referencia da variavel valor1 que contem o numero inserido pelo utilizador
            sub AX, '0' ; convertemos

            mov BX, [valor2]
            sub BX, '0'
            
            add AX, BX ; fazemos a operação aritmetica entre os dois registradores
            add AX, '0' ; to convert the sum from decimal to ASCII

            mov [res], AX ; movemos para a variavel res que estamos referenciando na memoria em que ira receber o valor acomulado em AX

            mov ECX, result ; fazemos o output da msg resultado
            call mostrarSaida

            jmp resultado ;  em seguida saltamos para o label resultado que ira retornar o valor contido nessa varivel reservada em section .bss
        
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
            add AX, '0'

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
            add AX, '0'

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

            mov AL, [valor1] ; Foi utilizado os registradores AL e BL devido a operação de divisão
            sub AL, '0'

            mov BL, [valor2]
            sub BL, '0'
            
            div BL
            add AL, '0'

            mov [res], AL

            mov ECX, result
            call mostrarSaida

            jmp resultado

        resultado:
            mov ECX, res
            call mostrarSaidaNumero
        
        escolha:
            mov ECX, qqTecla
            call mostrarSaida
            mov ECX, op5
            call mostrarSaida

            mov ECX, operacao2
            call mostrarEntradaNumero

            movzx AX, byte[operacao2] ; Zero-extend the byte to a word (unsigned)
            sub AX, '0'

            cmp AX, 1 ; se o valor inserido for 1 salta de volta ao ponto inicial
            je comecar
            ; se não prossiga e termina o programa
        exit:
            mov ECX, msgFim
            call mostrarSaida

            mov EAX, SYS_EXIT
            mov EBX, RETURN_VALUE
            int SYS_CALL


