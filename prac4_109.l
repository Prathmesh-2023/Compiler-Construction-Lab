%{
#include <stdio.h>
%}

%%

[a-z]    { putchar(yytext[0] - 32); }   
[A-Z]    { putchar(yytext[0] + 32); }   
.|\n     { putchar(yytext[0]); }       

%%

int main() {
    yylex();
    return 0;
}



