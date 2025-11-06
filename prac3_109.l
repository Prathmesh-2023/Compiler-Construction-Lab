%{
#include <stdio.h>

int words_starting_A = 0;
%}

%%

[Aa][A-Za-z0-9_]*    { words_starting_A++; }
.                    { }

%%

int main() {
    yylex();
    printf("Number of words starting with 'A' or 'a' : %d\n", words_starting_A);
    return 0;
}


