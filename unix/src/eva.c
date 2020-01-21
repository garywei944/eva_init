#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	if(argc-2) {
		puts("Usage: eva <passwd>");
		exit(1);
	}
	if(strcmp(argv[1], "tnemal")) {
		puts("Wrong passwd!");
		exit(1);
	}
	else {
		system("bash");
		exit(0);
	}
}

