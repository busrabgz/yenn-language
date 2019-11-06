
LEX = lex
YACC = yacc -d

CC = gcc

all: parser clean

parser: y.tab.c
		$(CC) -o parser y.tab.c

y.tab.c y.tab.h: yacc_specification lex.yy.c
		$(YACC) -v yacc_specification

lex.yy.c: lex_specification 
		$(LEX) lex_specification

clean:
	-rm -f *.o *.output *.tab.* lex.yy.c