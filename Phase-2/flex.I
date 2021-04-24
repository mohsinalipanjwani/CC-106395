%{

#include <stdlib.h>
#include <stdio.h>
#include "symboltable.h"
#include "tokens.h"

entry_t** symbol_table;
entry_t** constant_table;
int cmnt_strt = 0;

%}

letter [a-zA-Z]
digit [0-9]
ws  [ \t\r\f\v]+
identifier (_|{letter})({letter}|{digit}|_){0,31}
hex [0-9a-f]

 /* Exclusive states */
%x CMNT
%x PREPROC

%%
/* Keywords*/
"int"                             {printf("\t%-30s : %3d\n",yytext,INT);}
"long"                            {printf("\t%-30s : %3d\n",yytext,LONG);}
"long long"                       {printf("\t%-30s : %3d\n",yytext,LONG_LONG);}
"short"                           {printf("\t%-30s : %3d\n",yytext,SHORT);}
"signed"                          {printf("\t%-30s : %3d\n",yytext,SIGNED);}
"unsigned"                        {printf("\t%-30s : %3d\n",yytext,UNSIGNED);}
"for"                             {printf("\t%-30s : %3d\n",yytext,FOR);}
"break"                           {printf("\t%-30s : %3d\n",yytext,BREAK);}
"continue"                        {printf("\t%-30s : %3d\n",yytext,CONTINUE);}
"if"                              {printf("\t%-30s : %3d\n",yytext,IF);}
"else"                            {printf("\t%-30s : %3d\n",yytext,ELSE);}
"return"                          {printf("\t%-30s : %3d\n",yytext,RETURN);}
