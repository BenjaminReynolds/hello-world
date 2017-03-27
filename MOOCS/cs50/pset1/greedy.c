#include <stdio.h>
#include <cs50.h>
#include <math.h>

#define QUARTER 25
#define DIME 10
#define NICKEL 5

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
		if (cents >= QUARTER)
		{
			cents -= QUARTER;
			total += 1;
		}
		else if (cents >= DIME)
		{
			cents -= DIME;
			total += 1;
		}
		else if (cents >= NICKEL)
		{
			cents -= NICKEL;
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
