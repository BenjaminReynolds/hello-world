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
    
    /**
     * calculates the number of bottles of water per minute that are used
     * by a shower n minutes long and displays the result to the user.
     **/
    
    printf("bottles: %i\n", n * 12);
}