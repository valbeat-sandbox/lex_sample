%{
int line = 0;
%}
%%
\n	{ line++; }
.	{ /* do nothing */}
%%
main() {
	while(yylex() != 0) {
	}
	printf("%d linex\n", line);
}
