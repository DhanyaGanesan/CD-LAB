# Experiment-7: Three Address Code Generation using LEX and YACC

## Aim
To write a program using LEX and YACC to generate three-address code (TAC) for a simple arithmetic expression.

## Algorithm
**LEX:**
1. Include required headers and the generated `tac.tab.h`.
2. Define patterns for identifiers `[a-zA-Z][a-zA-Z0-9]*` and numbers `[0-9]+`, storing the matched text in `yylval.str` and returning `ID`/`NUM`.
3. Skip whitespace; return any other single character as itself.

**YACC:**
1. Declare tokens `ID`, `NUM` and a `%union` with a `char *str` field to carry lexeme/temp values.
2. Define operator precedence for `+ - * /`.
3. For each binary operation in `expr`, generate a new temporary variable (`t1`, `t2`, ...), print the three-address instruction, and propagate the temporary as the result of that sub-expression.
4. On reducing the top-level `stmt` (`ID '=' expr`), print the final assignment.

## Procedure
1. Write `tac.l` to tokenize identifiers, numbers, and operators.
2. Write `tac.y` to build TAC using a temporary-variable counter during grammar reduction.
3. Compile:
   ```
   bison -d tac.y
   flex tac.l
   gcc tac.tab.c lex.yy.c -o tac -lfl
   ```
4. Run `./tac` and enter an expression like `a = b + c * d`.

## Program
See `tac.l` and `tac.y` in this folder.

## Output
```
Enter the expression:
a = b + c * d
t1 = c * d
t2 = b + t1
a = t2
```

## Result
Thus, the program to generate three-address code using LEX and YACC was executed and verified successfully.
