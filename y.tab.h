/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUMBER = 258,
    NUMBER_I = 259,
    DIGITS = 260,
    DIGIT1to9 = 261,
    DIGIT = 262,
    NUMBER_F = 263,
    STRING = 264,
    TAG = 265,
    OPENBRA = 266,
    CLOSEBRA = 267,
    OPENPAR = 268,
    CLOSEPAR = 269,
    OPENARRAY = 270,
    CLOSEARRAY = 271,
    STRINGSYMBOL = 272,
    COMMA = 273,
    DOUBLEPOINT = 274,
    INT = 275,
    FRAC = 276,
    EXP = 277,
    E = 278,
    HEX_DIGIT = 279,
    TRUE_J = 280,
    FALSE_J = 281,
    NULL_J = 282
  };
#endif
/* Tokens.  */
#define NUMBER 258
#define NUMBER_I 259
#define DIGITS 260
#define DIGIT1to9 261
#define DIGIT 262
#define NUMBER_F 263
#define STRING 264
#define TAG 265
#define OPENBRA 266
#define CLOSEBRA 267
#define OPENPAR 268
#define CLOSEPAR 269
#define OPENARRAY 270
#define CLOSEARRAY 271
#define STRINGSYMBOL 272
#define COMMA 273
#define DOUBLEPOINT 274
#define INT 275
#define FRAC 276
#define EXP 277
#define E 278
#define HEX_DIGIT 279
#define TRUE_J 280
#define FALSE_J 281
#define NULL_J 282

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 14 "json.y" /* yacc.c:1909  */

    long long int int_v;
    long double float_v;
    int int_j;
    int bool_v;
    int null_p;
    char* string_v;

#line 117 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
