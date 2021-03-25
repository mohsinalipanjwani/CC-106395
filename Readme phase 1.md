#CC Spring 2021: Project Phase 1#
###PROJECT MEMBERS###
StdID | Name
------------ | -------------
**60788** | **Shinal Shafqat** <!--this is the group leader in bold-->
62008 | Mohsin Ali
<!-- Replace name and student ids with acutally group member names and ids-->

## Language Selected ##
Mini C
<!--Replace with your choice-->
## Example of main constructs ##
MiniC is a simple subset of the standard C language
It does NOT include:
arrays
structs
unions
files
sets
switch statements
do statements
or or many of the low level operators
The only data types permitted:
int
float
# This is a Sample program in mini c```
int main ()
{
  float cos, x, n, term, eps, alt;
  // compute the cosine of x to within tolerance eps
  // use an alternating series

  x = 3.14159;
  eps = 0.1;
  n = 1;
  cos = 1;
  term = 1;
  alt = -1;
  
  while (term>eps)
  {
    term = term * x * x / n / (n+1);
    cos = cos + alt * term;
    alt = -alt;
    n = n + 2;
  }
}
```

# Lexical Specification#

SINGLE_COMMENT \/\/.+
    MULTI_COMMENT \/\*(.|\n)*?\\*\/ ?
    INTEGRAL_LITERAL \b0|[1-9][0-9]*\b
    FlOAT_LITERAL [0-9]+\.[0-9]+

## Language CFG ##
PROG -> LIB FUNCTION | ;
Function      ->  Type identifier ( ArgList ) CompoundStmt
ArgList       ->  Arg
                  | ArgList , Arg
Arg           ->  Type identifier
Declaration   ->  Type IdentList ;
Type          ->  int
                  | float
                 
# Context free grammar example

program -> decl_list

decl_list -> decl decl_list'
decl_list' -> decl decl_list' | ϵ
decl -> var_decl | fun_decl

var_decl -> type_spec IDENT var_decl'
var_decl' -> ; | [ ] ;

type_spec -> VOID
            | BOOL
            | INT
            | FLOAT

fun_decl -> type_spec IDENT ( params ) compound_stmt

params -> param_list | VOID
param_list -> param param_list'
param_list' -> , param param_list' | ϵ
param -> type_spec IDENT param'
param' -> [ ] | ϵ

stmt_list -> stmt_list'
stmt_list' -> stmt stmt_list' | ϵ

stmt -> expr_stmt
        | compound_stmt
        | local_decls
        | if_stmt
        | while_stmt
        | return_stmt
        | break_stmt

expr_stmt -> expr ; | ;

return_stmt -> RETURN return_stmt'
return_stmt' -> ; | expr ;

while_stmt -> WHILE ( expr ) stmt

compound_stmt -> { stmt_list }

if_stmt -> IF ( expr ) stmt if_stmt'
if_stmt' -> ELSE stmt | ϵ

local_decls -> local_decls'
local_decls' -> local_decl local_decls' | ϵ
local_decl -> type_spec IDENT local_decl'
local_decl' -> ; | [ ] ;



expr -> IDENT expr'' expr''''
          | ! expr expr''''
          | - expr expr''''
          | + expr expr''''
          | ( expr ) expr''''
          | BOOL_LIT expr''''
          | INT_LIT expr''''
          | FLOAT_LIT expr''''
          | NEW type_spec [ expr ] expr''''

expr' -> = expr
          | ϵ

expr'' -> [ expr ] expr'
          | = expr
          | ( args )
          | . size
          | ϵ

expr''' -> OR expr
          | EQ expr
          | NE expr
          | LE expr
          | < expr
          | GE expr
          | > expr
          | AND expr
          | + expr
          | - expr
          | * expr
          | / expr
          | % expr
          | & expr

expr'''' -> expr''' expr''''
          | ϵ

args -> arg_list | ϵ
arg_list -> expr arg_list'
arg_list' -> , expr arg_list' | ϵ


                  
