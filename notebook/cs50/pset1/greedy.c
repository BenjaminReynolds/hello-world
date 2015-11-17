#include <stdio.h>
#include <cs50.h>
#include <math.h>

int main(void)
{
	float input;
		
	// gets a validates users input
		
	do
	{
		printf("Hello there user! How much change is owed?\n");
		input = GetFloat();
	}
	while (input <= 0);
	
	// converts input to a number of cents
	int cents = (int) round(input * 100);
	
	// initialize the return value
	int total = 0;
	
	/* loop over the converted input, decreasing the value and increasing the
	 return value with each iteration 8 */
	
	while (cents > 0)
	{
		if (cents >= 25)
		{
			cents -= 25;
			total += 1;
		}
		else if (cents >= 10)
		{
			cents -= 10;
			total += 1;
		}
		else if (cents >= 5)
		{
			cents -= 5;
			total += 1;
		}
		else
		{
			cents -= 1;
			total += 1;
		}
	}
	
	printf("%d\n", total);
}
