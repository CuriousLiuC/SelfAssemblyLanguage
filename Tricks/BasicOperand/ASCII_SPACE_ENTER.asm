DATAS SEGMENT
    ;此处输入数据段代码  
    STRING DB "HELLO WORLD","$"

	X DW 1H
	Y DW 2H
	
	T DW 48D;STRING PIAN YI
	
	ENTERSPACE DW 0AH
	SPACE DW 32D

		

DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
    DW 20H DUP(0)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    MOV DX,X
    ADD DX,T
    MOV AH,02H
    INT 21H
    
    MOV DX,SPACE
    MOV AH,02H
    INT 21H
    
    MOV DX,Y
    ADD DX,T
    MOV AH,02H
    INT 21H
    

	MOV DX,ENTERSPACE
	MOV AH,02H
	INT 21H
	

    LEA DX,STRING
    MOV AH,09H
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START