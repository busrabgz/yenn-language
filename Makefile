
LEX = lex
YACC = yacc -d

CC = gcc

all: parser clean

parser: y.tab.c
		$(CC) -o parser y.tab.c

y.tab.c y.tab.h: CS315f19_group28.yacc lex.yy.c
		$(YACC) -v CS315f19_group28.yacc

lex.yy.c: CS315f19_group28.lex 
		$(LEX) CS315f19_group28.lex

clean:
	-rm -f *.o *.output *.tab.* lex.yy.c