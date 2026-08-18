%{
#include "art_expr.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]   { return yytext[0]; }
[ \t\n]     ;
.           ;

%%

int yywrap()
{
    return 1;
}
