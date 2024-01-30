section .text

    global adicionar
    global multiplicar
    global divisao
    global subtrair

    adicionar:
        add EDI, ESI
        mov EAX, EDI
        ret
    
    multiplicar:
        mov EAX, EDI
        mul ESI
        ret
    
    divisao:
        mov EAX, EDI 
        cwd ; converts the signed word in AX to a signed doubleword in DX:AX 
        ; by extending the most significant bit of AX into all the bits of DX
        div ESI
        ret
    
    subtrair:
        sub EDI, ESI
        mov EAX, EDI
        ret