#include<stdio.h>
#include<stdlib.h>

int main (void) {
	int x = 10,y= 5;
	if (x　< y){
		printf("xはyより小さい");
	} else if (y > x) {
		printf("xはより大きい");
	} else {
		printf("ok!");
	}
	return 0;
}