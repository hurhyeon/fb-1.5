/* recognize tokens for the calculator and print them out */
%{
#include "fb1-5.tab.h"
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+(\.[0-9]+)? { yylval.floatval = atof(yytext); return NUMBER; }
\n { return EOL; }
"(" { return OP; }
")" { return CP; }
"//".* /* ignore comments */
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }
%%
