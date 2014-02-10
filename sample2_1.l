%{
int lines = 0;
int chars = 0;
%}
%%
\n	{ lines++; chars++; }
.	{ chars++; }
%%
main() {
	while(yylex() != 0) {
	}
	printf("%d chars\n", chars);
	printf("%d lines\n", lines);
}
