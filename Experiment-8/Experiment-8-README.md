# Experiment-8: Type Checking using LEX and YACC

## Aim
To write a program using LEX and YACC to implement type checking of variable declarations and assignment expressions using a symbol table.

## Algorithm
**LEX:**
1. Tokenize keywords `int` and `float`, identifiers, numbers, and operators `= + - * / ;`.
2. Return matched identifier/number text via `yylval.str`.

**YACC:**
1. Maintain a symbol table (`struct sym`) storing variable name and type, filled in on each declaration (`decl`).
2. On an assignment (`ID '=' expr ';'`), look up the type of the left-hand variable using `typeOf()`.
3. Recursively determine the type of the right-hand expression: propagate type through `+ - * /` only if both operand types match, otherwise mark "mismatch".
4. Compare the LHS variable's type with the computed expression type:
   - If the variable is undeclared → print "Undefined variable".
   - If types match → print "No type mismatch".
   - Else → print "Type mismatch".

## Procedure
1. Write `typecheck.l` for keyword/identifier/number/operator tokenization.
2. Write `typecheck.y` with grammar for `decl` and `assign`, including the symbol table logic.
3. Compile:
   ```
   bison -d typecheck.y
   flex typecheck.l
   gcc lex.yy.c typecheck.tab.c -o typecheck -lfl
   ```
4. Run `./typecheck`, enter declarations followed by assignments.

## Program
See `typecheck.l` and `typecheck.y` in this folder.

## Output
```
Enter declarations and expressions:
int a;
int b;
int c;
a = b * c;
No type mismatch in expression: a = ...
```
```
Enter declarations and expressions:
int a;
float b;
int c;
a = b + c;
Type mismatch in assignment to a
```

## Result
Thus, the LEX and YACC program for type checking using a symbol table was executed and verified successfully.
