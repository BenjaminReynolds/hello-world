#include <stdio.h>
#include <cs50.h>

#define BOTTLES_PER_MINUTE 12

int main(void)
{
    int n;
    
    // gets users input
    
    printf("minutes: ");
    n = GetInt();
    
     /**
      * calculates the number of bottles of water per minute that are used
      * by a shower n minutes long and displays the result to the user.
      **/
    
    printf("bottles: %i\n", n * BOTTLES_PER_MINUTE);
}