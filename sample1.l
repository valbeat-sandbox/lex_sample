%%
"auto"			{printf("auto!!\n");}
[_a-zA-Z][_a-zA-Z0-9]*	{printf("ident!!\n");}
[ \t\n]*		{/* do nothing */}
.*			{printf("other!!\n");}

%%

main(){
	while(yylex() != 0) {

	}
}
