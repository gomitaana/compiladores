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
    STRING = 259,
    TAG = 260,
    OPENBRA = 261,
    CLOSEBRA = 262,
    OPENPAR = 263,
    CLOSEPAR = 264,
    OPENARRAY = 265,
    CLOSEARRAY = 266,
    STRINGSYMBOL = 267,
    COMMA = 268,
    DOUBLEPOINT = 269,
    DIGIT1to9 = 270,
    DIGIT = 271,
    DIGITS = 272,
    token = 273,
    INT = 274,
    FRAC = 275,
    EXP = 276,
    E = 277,
    HEX_DIGIT = 278,
    TRUE = 279,
    FALSE = 280,
    NULL = 281
  };
#endif
/* Tokens.  */
#define NUMBER 258
#define STRING 259
#define TAG 260
#define OPENBRA 261
#define CLOSEBRA 262
#define OPENPAR 263
#define CLOSEPAR 264
#define OPENARRAY 265
#define CLOSEARRAY 266
#define STRINGSYMBOL 267
#define COMMA 268
#define DOUBLEPOINT 269
#define DIGIT1to9 270
#define DIGIT 271
#define DIGITS 272
#define token 273
#define INT 274
#define FRAC 275
#define EXP 276
#define E 277
#define HEX_DIGIT 278
#define TRUE 279
#define FALSE 280
#define NULL 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 14 "json.y" /* yacc.c:1909  */

    long long int int_v;
    long double float_v;
    bool bool_v;
    bool null_p;
    char* string_v;

#line 114 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
