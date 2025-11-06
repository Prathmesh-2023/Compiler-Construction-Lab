%{
#include <stdio.h>

/* Function to convert decimal string to hexadecimal */
void dec_to_hex(const char *str) {
    int num = 0;
    int i = 0;

    /* Convert string (decimal digits) to integer */
    while (str[i] != '\0') {
        num = num * 10 + (str[i] - '0');
        i++;
    }

    /* Convert integer to hexadecimal manually */
    char hex[50];
    int j = 0;
    if (num == 0) {
        printf("0x0");
        return;
    }

    while (num > 0) {
        int rem = num % 16;
        if (rem < 10)
            hex[j++] = rem + '0';
        else
            hex[j++] = rem - 10 + 'A';
        num /= 16;
    }

    printf("0x");
    /* Print in reverse */
    for (int k = j - 1; k >= 0; k--) {
        putchar(hex[k]);
    }
}
%}

%%
[0-9]+    { dec_to_hex(yytext); }
.|\n      { ECHO; }
%%

int main(void) {
    yylex();
    return 0;
}

