%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #define YYSTYPE char*
    char *strconcat(char *str1, char *str2);
    
    extern int yylex();
    extern int yylineno;
    extern FILE *yyin;
%}


%token NUMBER
%token STRING
%token true false null
%left O_BEGIN O_END A_BEGIN A_END
%left COMMA
%left COLON
%%
START: ARRAY {
printf("%s",$1);
  }
| OBJECT {
    printf("%s",$1);
  }
;
OBJECT: O_BEGIN O_END {
    $$ = "{}";
  }
| O_BEGIN MEMBERS O_END {
    $$ = (char *)malloc(sizeof(char)*(1+strlen($2)+1+1));
    sprintf($$,"<%s",$2);
  }
;
MEMBERS: PAIR {
    $$ = $1;
  }
| PAIR COMMA MEMBERS {
    $$ = (char *)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
    sprintf($$,"%s\n<%s",$1,$3);
  }
;
PAIR: STRING COLON VALUE {
    $$ = (char *)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($1)+1));
    sprintf($$,"%s>%s</%s>",$1,$3,$1);
  }
;
ARRAY: A_BEGIN A_END {
    $$ = (char *)malloc(sizeof(char)*(2+1));
    sprintf($$,"[]");
  }
| A_BEGIN ELEMENTS A_END {
    $$ = (char *)malloc(sizeof(char)*(1+strlen($2)+1+1));
    sprintf($$,"[%s]",$2);
}
;
ELEMENTS: VALUE {
    $$ = $1;
  }
| VALUE COMMA ELEMENTS {
    $$ = (char *)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
    sprintf($$,"%s,%s",$1,$3);
  }
;
VALUE: STRING {$$=yylval;}
| NUMBER {$$=yylval;}
| OBJECT {$$=$1;}
| ARRAY {$$=$1;}
| true {$$="true";}
| false {$$="false";}
| null {$$="null";}
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
    printf("ERROR\n");
    return -1;
  }
// set lex to read from it instead of defaulting to STDIN:
  yyin = myfile;
  
// parse through the input until there is no more:
  do {
    yyparse(); // make parsing occur
  } while (!feof(yyin));

   printf("\n");
}
