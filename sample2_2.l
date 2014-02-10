%{
int lines = 0;
int chars = 0;
int words = 0;
%}
%%
[^ \n\t]+ { words++;
	     chars+=strlen(yytext); }
\n	{ chars++; lines++; }
[ \t]	{ chars++; }
%%
main() {
	while(yylex() != 0) {
	}
	printf("%d chars\n", chars);
	printf("%d words\n", words);
	printf("%d lines\n", lines);
}
