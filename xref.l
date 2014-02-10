%{
#include<stdio.h>
#include<stdlib.h>

#define MAXSIZE 1000

struct LNUM {
	int lineno;
	struct LNUM *next;
};

struct LIST{
	struct LIST * next;
	char *word;

	struct LNUM *h;
	struct LNUM *t;
};

int lineno=1;
struct LIST *h, *t, *tmp, *tmp2;
struct LNUM *tmp3;
%}

%%
"auto" 		{ printf("reserved word!\n");}
"break"		{ printf("reserved word!\n");}
"case" 		{ printf("reserved word!\n");}
"char" 		{ printf("reserved word!\n");}
"const" 	{ printf("reserved word!\n");}
"contine" 	{ printf("reserved word!\n");}
"default" 	{ printf("reserved word!\n");}
"do" 		{ printf("reserved word!\n");}
"double" 	{ printf("reserved word!\n");}
"else" 		{ printf("reserved word!\n");}
"enum"	    { printf("reserved word!\n");}
"extern" 	{ printf("reserved word!\n");}
"float" 	{ printf("reserved word!\n");}
"for" 		{ printf("reserved word!\n");}
"goto" 		{ printf("reserved word!\n");}
"if" 		{ printf("reserved word!\n");}
"int" 		{ printf("reserved word!\n");}
"long" 		{ printf("reserved word!\n");}
"register" 	{ printf("reserved word!\n");}
"return" 	{ printf("reserved word!\n");}
"short" 	{ printf("reserved word!\n");}
"signed" 	{ printf("reserved word!\n");}
"sizeof" 	{ printf("reserved word!\n");}
"static" 	{ printf("reserved word!\n");}
"struct" 	{ printf("reserved word!\n");}
"switch" 	{ printf("reserved word!\n");}
"typedef" 	{ printf("reserved word!\n");}
"union"		{ printf("reserved word!\n");}
"unsigned"	{ printf("reserved word!\n");}
"void"		{ printf("reserved word!\n");}
"volatile"	{ printf("reserved word!\n");}
"while" 	{ printf("reserved word!\n");}

[_A-Za-z][_A-Za-z0-9]*	{
		for(tmp2 =h;
			tmp2->next != NULL;
			tmp2 = tmp2->next)
		{
			if (strcmp(tmp2->next->word,yytext) > 0) {
				break;
			}
		}

		tmp3 = (struct LNUM*)malloc(sizeof(struct LNUM));
		if (tmp3 == NULL) {
			perror("momory allocation error");
			exit(EXIT_FAILURE);
		}

		tmp3->lineno = lineno;
		tmp3->next = NULL;

		if (strcmp(yytext, tmp2->word) != 0){
			tmp = (struct LIST*)malloc(sizeof(struct LIST));
			if (tmp == NULL) {
				perror("memory allocation error");
				exit(EXIT_FAILURE);
			}
			tmp->word = (char*)malloc(strlen(yytext)+1);
			if (tmp == NULL) {
				perror("momory allocation error");
				exit(EXIT_FAILURE);
			}
			strcpy(tmp->word, yytext);
			tmp->h = tmp3;
			tmp->t = tmp3;

			tmp->next = tmp2->next;
			tmp2->next = tmp;
		} else {
			tmp2->t->next = tmp3;
			tmp2->t = tmp3;
		}
	}
.		{/* do nothing */}
"\n"	{ lineno++; }

%%
main() {
	h = (struct LIST*)malloc(sizeof(struct LIST));
	if(h == NULL) {
		perror("memoty allocation error");
		exit(EXIT_FAILURE);
	}
	t = h;
	h->next = NULL;
	h->word = "";

	while(yylex()!=0) {
	}

	for(tmp = h->next; tmp != NULL; tmp = tmp->next){
		printf("%s : ", tmp->word);

		for(tmp3 = tmp->h; tmp3 != NULL; tmp3 = tmp3->next){
			printf("%5d", tmp3->lineno);
		}
		printf("%5d", tmp3->lineno);
	}
}
