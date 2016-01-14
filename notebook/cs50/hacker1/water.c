#include <stdio.h>
#include <cs50.h>

int main(void)
{
    int n;
    
    // gets and validates users input
    
    do
    {
        printf("minutes: ");
        n = GetInt();
    }
    while (n < 1);
    
    /* calculates number of 16 ounce bottles for a shower of n 
    minutes based on 1.5 gallons of water per minute of shower 
    and displays the result to the user */
    
    printf("bottles: %i\n", n * 12);
}