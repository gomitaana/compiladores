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

TRUE "true"
FALSE "false"
NULL "null"
WORD [a-zA-z]+
STRING {STRINGSYMBOL}({WORD}|{NUMBER}|{WHITESPACE})*{STRINGSYMBOL}
TAG {STRINGSYMBOL}({WORD}|{NUMBER}|{WHITESPACE})*{STRINGSYMBOL}:

%%
{OPENBRA} printf("OPENBRA ");
{CLOSEBRA} printf("CLOSEBRA ");
{OPENPAR} printf("OPENPAR ");
{CLOSEPAR} printf("CLOSEPAR ");
{OPENARRAY} printf("OPENARRAY ");
{CLOSEARRAY} printf("CLOSEARRAY ");
{STRINGSYMBOL} printf("STRINGSYMBOL ");
{COMMA} printf("COMMA ");
{DOUBLEPOINT} printf("DOUBLEPOINT ");
{DIGIT1to9} printf("DIGIT1to9 ");
{DIGIT} printf("DIGIT ");
{DIGITS} printf("DIGITS ");
{INT} printf("INT ");
{FRAC} printf("FRAC ");
{EXP} printf("EXP ");
{E} printf("E ");
{HEX_DIGIT} printf("HEX_DIGIT ");
{NUMBER} printf("NUMBER ");
{TRUE} printf("TRUE ");
{FALSE} printf("FALSE ");
{NULL} printf("NULL ");
{WORD} printf("WORD ");
{STRING} printf("STRING ");

%%