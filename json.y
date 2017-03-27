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
    bool bool_v;
    bool null_p;
    char* string_v;
} 
/** Define types for union values */
%type<string_v> DOUBLE_QUOTED_STRING SINGLE_QUOTED_STRING STRING
%type<int_v> NUMBER_I
%type<float_v> NUMBER_F
%type<bool_v> BOOLEANlex json.l


//Tokens
%token <int_v> NUMBER
%token <string_v> STRING TAG
%token OPENBRA CLOSEBRA OPENPAR CLOSEPAR OPENARRAY CLOSEARRAY
%token STRINGSYMBOL COMMA DOUBLEPOINT
%token DIGIT1to9 DIGIT DIGITS
token INT FRAC EXP E HEX_DIGIT
%token TRUE FALSE NULL

%start interpreter

%%

interpreter: OPENBRA content CLOSEBRA
;
	    
content: TAG DOUBLEPOINT valueList 
    | content COMMA TAG DOUBLEPOINT valueList
;

valueList: attribute
    | array
    | object
;

object: TAG DOUBLEPOINT valueList 
    | object COMMA TAG DOUBLEPOINT valueList
;

array: OPENARRAY arrayItems CLOSEARRAY
;

arrayItems: attribute
    | arrayItems COMMA attribute
;

attribute:  STRING
    | NUMBER
    | DIGIT1to9
    | DIGIT
    | DIGITS
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