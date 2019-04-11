DATAS SEGMENT
    ;此处输入数据段代码
    STRING DB "please input the  number with the end 'enter' ","$"
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
    
    LEA DX,STRING
    MOV AH,09H
    INT 21H
   
    MOV DX,0AH
    MOV AH,02H
    INT 21H
;--------------------------------------------------------    
      	
  	;写一个循环，直到接收到ENTER为止
  	
  	LOO:
  	
  	MOV BL,AL;BL = AL
    SAL BL,1;2BL
    SAL BL,1;4BL
    ADD BL,AL;10BL
    SAL BL,1;10BL
  	
  	
  	MOV AH,01H;输入回显
  	INT 21H    
    
    
    
    
    CMP AL,13D;如果等于回车，则zf变成1
	JE LP
    ADD BL,AL
    JMP LOO

    LP:
;-----------------------------------------------------------    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

