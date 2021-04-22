/* Defination section/*
%{
int count = 0;
%}
%{
int count = 0;
%}
  
/*** Rule Section r***/
%%
[A-Z] {printf("%s capital letter\n", yytext);
       count++;}
.     {printf("%s not a capital letter\n", yytext);}
\n    {return 0;}
%%
  
/**Code Section prints the number of
capital letter present in the given input**/
int yywrap(){}
int main(){
  

  
 
 FILE *fp;
 char filename[50];
 printf("Enter the filename: \n");
 scanf("%s",filename);
 fp = fopen(filename,"r");
 yyin = fp;
  
yylex();
printf("\nNumber of Captial letters " 
      "in the given input - %d\n", count);
  
return 0;
}
