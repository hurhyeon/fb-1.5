/* simplelest version calculator */
%{
#include <stdio.h>
%}
/*%define api.value.type {float}*/
%union
{
    float floatval;
}
%token <floatval> NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP

%type <floatval> exp factor term

%%

calclist: /* noting */
   
   | calclist exp EOL { printf(" = %f\n", $2); }
   | calclist EOL { }
   ;

exp: factor
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;

factor: term
   | factor MUL term { $$ = $1 * $3; }
   | factor DIV term { $$ = $1 / $3; }
   ;

term: NUMBER
   | ABS term { $$ = $2 >=0? $2 : - $2; }
   | OP exp CP { $$ = $2; }
   ;

%%

int main(int argc, char **argv)
{
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n" ,s);
}
