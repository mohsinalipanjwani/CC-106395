%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "symboltable.h"

	entry_t** symbol_table;
  entry_t** constant_table;

	double Evaluate (double lhs_value,int assign_type,double rhs_value);
	int current_dtype;
	int yyerror(char *msg);
%}

%union
{
	double dval;
	entry_t* entry;
	int ival;
}

%token <entry> IDENTIFIER

 /* Constants */
%token <dval> DEC_CONSTANT HEX_CONSTANT
%token STRING

 /* Logical and Relational operators */
%token LOGICAL_AND LOGICAL_OR LS_EQ GR_EQ EQ NOT_EQ

 /* Short hand assignment operators */
%token MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN SUB_ASSIGN
%token LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN XOR_ASSIGN OR_ASSIGN
%token INCREMENT DECREMENT

 /* Data types */
%token SHORT INT LONG LONG_LONG SIGNED UNSIGNED CONST
