# Traductor JSON to XML
Final project 

RUN LEX
lex json.l
gcc lex.yy.c -lfl 
./a.out test.txt

yacc -d json.y
lex json.l
cc lex.yy.c y.tab.c -o json  -lfl
./json


yacc -d json.y
lex json.l
cc lex.yy.c y.tab.c -o json  -lfl

yacc json.y
yacc -d json.y
lex json.l
cc lex.yy.c y.tab.c -o json -lfl