# Experiment-9: Simple Code Optimization Techniques using LEX and YACC

## Aim
To write a program using LEX and YACC to implement simple code optimization techniques — constant folding, algebraic simplification, and strength reduction — on three-address-code-style statements.

## Algorithm
**LEX:**
1. Tokenize identifiers, numbers, and operators `= + - * / ;`.

**YACC:**
1. While reducing each `expr` production, inspect the operands:
   - **Constant Folding:** if both operands are numeric constants, compute the result immediately (e.g., `2 + 4 -> 6`).
   - **Algebraic Simplification:** apply identities such as `x + 0 -> x`, `x - 0 -> x`, `x * 1 -> x`, `x / 1 -> x`.
   - **Strength Reduction:** replace `x * 2` with `x + x` (cheaper addition instead of multiplication).
   - Otherwise, keep the expression as a string concatenation of operands and operator.
2. Print the applied optimization as a comment, then print the final optimized assignment.

## Procedure
1. Write `optimize.l` to tokenize identifiers, numbers, and operators.
2. Write `optimize.y` with per-operator semantic actions implementing the three optimizations.
3. Compile:
   ```
   bison -d optimize.y
   flex optimize.l
   gcc lex.yy.c optimize.tab.c -o optimize -lfl
   ```
4. Run `./optimize` and enter TAC-style statements ending with `;`.

## Program
See `optimize.l` and `optimize.y` in this folder.

## Output
```
Enter Three Address Code statements (end with Ctrl+D):
a = 2 + 4;
// Constant Folding: 2+4 -> 6
a = 6
b = d * 1;
// Algebraic Simplification: x*1 -> x
b = d
c = s * 2;
// Strength Reduction: x*2 -> x+x
c = s + s
```

## Result
Thus, the LEX and YACC program implementing constant folding, algebraic simplification, and strength reduction was executed and verified successfully.
