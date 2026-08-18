%{
#include <stdio.h>

int yylex(void);
int yyerror(char *s);
%}

%token VALID INVALID

%%

input:
    VALID   { printf("Valid Variable\n"); }
    | INVALID { printf("Invalid Variable\n"); }
    ;

%%

int main()
{
    printf("Enter a variable: ");
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Invalid Variable\n");
    return 0;
}
