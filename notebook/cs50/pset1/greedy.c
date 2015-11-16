#include <stdio.h>
#include <cs50.h>
#include <math.h>

int main(void)
{
	int input;
		
	// gets a validates users input
		
	do
	{
		printf("Hello there user! How much change is owed");
		input = GetFloat();
	}
	while (input <= 0);
	
	// converts input to a number of cents
	
	// initialize the return value
	
	int total = 0;
	
	// loop over the converted input, decreasing the value and increasing the
	// return value with each iteration
	
	while (input > 0)
	{
		
	}
	
	printf("%d\n", total);
}
