%{
#include <stdlib.h>
#include <stdio.h>
%}

OPENBRA "\{"
CLOSEBRA "\}"
OPENPAR "\("
CLOSEPAR "\)"
OPENARRAY "\["
CLOSEARRAY "\]"
STRINGSYMBOL "\""
COMMA "\,"
DOUBLEPOINT "\:"

WHITESPACE "\t"|"\n"|" "
DIGIT1to9 [1-9]
DIGIT [0-9]
DIGITS {DIGIT}+
INT {DIGIT}|{DIGIT1to9}{DIGITS}|-{DIGIT}|-{DIGIT1to9}{DIGITS}
FRAC [.]{DIGITS}
EXP {E}{DIGITS}
E [eE][+-]?
HEX_DIGIT [0-9a-f]
NUMBER {INT}|{INT}{FRAC}|{INT}{EXP}|{INT}{FRAC}{EXP}

TRUE "true"
FALSE "false"
NULL "null"
WORD [a-zA-z]+
STRING {STRINGSYMBOL}({WORD}|{NUMBER}|{WHITESPACE})*{STRINGSYMBOL}

%%
[\t]

{OPENPAR} {printf("hi");}
{CLOSEPAR} {printf("bye");}

%%