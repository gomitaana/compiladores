%{
#include "y.tab.h"
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

WHITESPACE "\t"|" "
DIGIT1to9 [1-9]
DIGIT [0-9]
DIGITS {DIGIT}+
INT {DIGIT}|{DIGIT1to9}{DIGITS}|-{DIGIT}|-{DIGIT1to9}{DIGITS}
FRAC [.]{DIGITS}
EXP {E}{DIGITS}
E [eE][+-]?
HEX_DIGIT [0-9a-f]
NUMBER {INT}|{INT}{FRAC}|{INT}{EXP}|{INT}{FRAC}{EXP}

TRUE_J "true"
FALSE_J "false"
NULL_J "null"
WORD [a-zA-z]+
STRING {STRINGSYMBOL}({WORD}|{NUMBER}|{WHITESPACE})*{STRINGSYMBOL}
TAG {STRINGSYMBOL}({WORD}|{NUMBER}|{WHITESPACE})*{STRINGSYMBOL}DOUBLEPOINT

%%
[\t]

{STRING} {return (STRING);}

{OPENBRA} {return (OPENBRA);}
{CLOSEBRA} {return (CLOSEBRA);}
{OPENPAR} {return (OPENPAR);}
{CLOSEPAR} {return (CLOSEPAR);}
{OPENARRAY} {return (OPENARRAY);}
{CLOSEARRAY} {return (CLOSEARRAY);}
{STRINGSYMBOL} {return (STRINGSYMBOL);}
{COMMA} {return (COMMA);}
{DOUBLEPOINT} {return (DOUBLEPOINT);}
{DIGIT1to9} {return (DIGIT1to9);}
{DIGIT} {return (DIGIT);}
{DIGITS} {return (DIGITS);}
{INT} {return (INT);}
{FRAC} {return (FRAC);}
{EXP} {return (EXP);}
{E} {return (E);}
{HEX_DIGIT} {return (HEX_DIGIT);}
{NUMBER} {return (NUMBER);}
{TRUE_J} {return (TRUE_J);}
{FALSE_J} {return (FALSE_J);}
{NULL_J} {return (NULL_J);}
{TAG} {return (TAG);}

%%