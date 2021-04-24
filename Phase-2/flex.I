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

{identifier}                      {printf("\t%-30s : %3d\n", yytext,IDENTIFIER);
                                  insert( symbol_table,yytext,IDENTIFIER );}
{ws}                              ;
[+\-]?[0][x|X]{hex}+[lLuU]?        {printf("\t%-30s : %3d\n", yytext,HEX_CONSTANT);
									insert( constant_table,yytext,HEX_CONSTANT);}
[+\-]?{digit}+[lLuU]?              {printf("\t%-30s : %3d\n", yytext,DEC_CONSTANT);
									insert( constant_table,yytext,DEC_CONSTANT);}
"/*"                              {cmnt_strt = yylineno; BEGIN CMNT;}
<CMNT>.|{ws}                      ;
<CMNT>\n                          {yylineno++;}
<CMNT>"*/"                        {BEGIN INITIAL;}
<CMNT>"/*"                        {printf("Line %3d: Nested comments are not valid!\n",yylineno);}
<CMNT><<EOF>>                     {printf("Line %3d: Unterminated comment\n", cmnt_strt); yyterminate();}
^"#include"                       {BEGIN PREPROC;}
<PREPROC>"<"[^<>\n]+">"            {printf("\t%-30s : %3d\n",yytext,HEADER_FILE);}
<PREPROC>{ws}                       ;
<PREPROC>\"[^"\n]+\"              {printf("\t%-30s : %3d\n",yytext,HEADER_FILE);}
<PREPROC>\n                       {yylineno++; BEGIN INITIAL;}
<PREPROC>.                        {printf("Line %3d: Illegal header file format \n",yylineno);}
"//".*                            ;

\"[^\"\n]*\"     {

  if(yytext[yyleng-2]=='\\') /* check if it was an escaped quote */
  {
    yyless(yyleng-1);       /* push the quote back if it was escaped */
    yymore();
  }
  else
  insert( constant_table,yytext,STRING);
 }

