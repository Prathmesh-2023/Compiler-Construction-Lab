%{
#include <stdio.h>
#include <string.h>

int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int lines = 0;
int spaces = 0;
char keywords_arr[NUM_KEYS][20] = {
    "int", "float", "if", "else", "for", "while", "return", "break", "char", "void"
};
int is_keyword(char str[]) {
    int i;
    for (i = 0; i < NUM_KEYS; i++) {
        if (strcmp(str, keywords_arr[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%
"//".*                 { comments++; }
"/*"([^*]|\n)*"*/"     { comments++; }
[ \t]                  { spaces++; }
\n                     { lines++; }
[A-Za-z_][A-Za-z0-9_]* {
                          words++;
                          if (is_keyword(yytext)) keywords++;
                          else identifiers++;
                       }
.                      { }
%%
int main() {
    yylex();
    printf("Comments     : %d\n", comments);
    printf("Keywords     : %d\n", keywords);
    printf("Identifiers  : %d\n", identifiers);
    printf("Words (total): %d\n", words);
    printf("Lines        : %d\n", lines);
    printf("Spaces       : %d\n", spaces);
    return 0;
}

