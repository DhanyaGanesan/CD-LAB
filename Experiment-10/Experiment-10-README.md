# Experiment-10: Compiler Back-End — 8086 Assembly Code Generation from TAC

## Aim
To write a program using LEX and YACC that takes three-address code (TAC) as input and generates equivalent 8086 assembly language code.

## Algorithm
**LEX:**
1. Tokenize identifiers and the operators `= + - * / ;` from each TAC line.

**YACC:**
1. On the first operand of an expression, emit `MOV AX, operand`.
2. On `+`, emit `ADD AX, operand`; on `-`, emit `SUB AX, operand`.
3. On `*`, emit `MUL operand`; on `/`, emit `MOV DX,0`, `MOV BX,operand`, `DIV BX`.
4. When a full statement (`ID '=' expr ';'`) is reduced, emit `MOV result, AX` to store the value back.
5. Repeat for every TAC line in the input.

## Procedure
1. Write `backend.l` to tokenize identifiers and operators.
2. Write `backend.y` embedding 8086 instruction generation in the grammar's semantic actions.
3. Compile:
   ```
   bison -d backend.y
   flex backend.l
   gcc lex.yy.c backend.tab.c -o backend -lfl
   ```
4. Run `./backend` and enter TAC statements, e.g. `t1 = a + b`.

## Program
See `backend.l` and `backend.y` in this folder.

## Output
```
Enter TAC statements (end with Ctrl+D):
t1 = a + b;
t2 = t1 - c;
t3 = t2 * d;
t4 = t3 / e;
x = t4;

MOV AX, a
ADD AX, b
MOV t1, AX

MOV AX, t1
SUB AX, c
MOV t2, AX

MOV AX, t2
MUL d
MOV t3, AX

MOV AX, t3
MOV DX, 0
MOV BX, e
DIV BX
MOV t4, AX

MOV AX, t4
MOV x, AX
```

## Result
Thus, the back-end of the compiler was successfully implemented using LEX and YACC to translate three-address code into equivalent 8086 assembly language code.
