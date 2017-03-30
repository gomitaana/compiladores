%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yylineno;
extern FILE *yyin;

int sym[26];
%}

%union
{
    long long int int_v;
    long double float_v;
    int int_j;
    int bool_v;
    int null_p;
    char* string_v;
} 
/** Define types for union values */
//%type<string_v> DOUBLE_QUOTED_STRING SINGLE_QUOTED_STRING STRING
//%type<int_v> NUMBER_I
//%type<float_v> NUMBER_F
//%type<bool_v> BOOLEAN


//Tokens
%token <int_v> NUMBER NUMBER_I
%token <int_j> DIGITS DIGIT1to9 DIGIT
%token <float_v> NUMBER_F
%token <string_v> STRING TAG
%token OPENBRA CLOSEBRA OPENPAR CLOSEPAR OPENARRAY CLOSEARRAY
%token STRINGSYMBOL COMMA DOUBLEPOINT
%token INT FRAC EXP E HEX_DIGIT
%token TRUE_J FALSE_J NULL_J

%start interpreter

%%

interpreter: OPENBRA content CLOSEBRA           {printf(" Start ");}
    | {printf("error on interpreter"); return -1;}
;
	    
content: STRING valueList           {printf(" Value ");}
    | content COMMA STRING valueList {printf(" Value ");}
    | {printf("error on content"); return -1;}
;

valueList: DOUBLEPOINT attribute                            {printf(" Atrribute ");}
    | DOUBLEPOINT array                                     {printf(" Array ");}
    | DOUBLEPOINT OPENBRA object CLOSEBRA                   {printf(" Object ");}
    | {printf("error on valueList"); return -1;}
;

object: STRING valueList            {printf(" ObjectContent ");}
    | object COMMA STRING valueList {printf(" ObjectContent ");}
    | {printf("error on object"); return -1;}
;

array: OPENARRAY arrayItems CLOSEARRAY          {printf(" Arraystart ");}
;

arrayItems: attribute
    | arrayItems COMMA attribute    {printf(" Array Content ");}
;

attribute:  STRING              {printf(" STRING ");}
    | NUMBER                    {printf(" NUMBER ");}
    | DIGIT1to9                 {printf(" DIGIT1to9 ");}
    | DIGIT                     {printf(" DIGIT ");}
    | DIGITS                    {printf(" DIGITS ");}
    | NUMBER_F                  {printf(" NUMBER_F ");}
    | NUMBER_I                  {printf(" NUMBER_I ");}
    | {printf("error on attribute"); return -1;}
;

%%

yyerror(s)
char *s;
{
  if(!yychar==0)
  {
     fprintf(stderr, "%s: token %d on line %d\n", s, yychar, yylineno);
  }
}

main()
{
// leo del archivo
  FILE *myfile = fopen("test.txt", "r");
  if (!myfile) {
    printf("Not readable");
    return -1;
  }
// set lex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  
// parse through the input until there is no more:
  do {
    yyparse(); // make parsing occur
  } while (!feof(yyin));
   //printf("\nGrammar check done... \n\n");
}