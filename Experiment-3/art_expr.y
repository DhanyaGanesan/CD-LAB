%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUMBER
    ;

%%

int yyerror(char *s)
{
    printf("Invalid Expression\n");
    return 0;
}

int main()
{
    printf("Enter the Expression: ");
    if (yyparse() == 0)
        printf("Valid Expression\n");

    return 0;
}
