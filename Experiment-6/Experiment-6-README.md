# Experiment-6: Recognize a Valid Variable using LEX and YACC

## Aim
To write a program using LEX and YACC to recognize whether a given input is a valid variable name — starting with a letter and followed by any number of letters or digits.

## Algorithm
**LEX:**
1. Declare required header files within `%{ ... %}`.
2. Define a regular expression `[a-zA-Z][a-zA-Z0-9]*` to match a valid variable pattern and return token `VALID`.
3. Any other non-whitespace character sequence returns token `INVALID`.
4. Whitespace and newlines are skipped.

**YACC:**
1. Declare tokens `VALID` and `INVALID`.
2. Define a grammar rule `input` that accepts either token and prints the corresponding message.
3. `yyparse()` drives the recognition process; `yyerror()` handles unmatched/invalid grammar.

## Procedure
1. Create `variable.l` and define the LEX patterns for valid/invalid variable tokens.
2. Create `variable.y` and define the grammar rule to print "Valid Variable" or "Invalid Variable".
3. Compile using:
   ```
   bison -d variable.y
   flex variable.l
   gcc lex.yy.c variable.tab.c -o variable -lfl
   ```
4. Run `./variable`, enter a variable name, and observe the result.

## Program
See `variable.l` and `variable.y` in this folder.

## Output
```
$ echo "abc123" | ./variable
Enter a variable: Valid Variable

$ echo "123abc" | ./variable
Enter a variable: Invalid Variable
```

## Result
Thus, the LEX and YACC program to recognize a valid variable name was executed and verified successfully.
