#CC Spring 2021: Project Phase 1#
##PROJECT MEMBERS##
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
# This is a Sample program in mini c
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

# Lexical Specification

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

## Problems Faced ##

### Problem 1: First time using mini C or mini java ###
At initial stage it was difficult for us to understand these language and making project in these language was the hardest part.but by the time we understand some basics which help us and then we are able to make small project in it. although it was diffucult but some how we manage to do so.

### Problem 1: Small Community ###
It was difficult for us to find help from internet as both of the language have small user community over other languages which are popular now
