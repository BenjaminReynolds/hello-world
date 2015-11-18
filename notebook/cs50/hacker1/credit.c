#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    long long input, card;
    int total = 0, x = 0;
    int ary[16];
    
    do
    {
        printf("Card number to validate:");
        input = GetLongLong();
    }
    while (input <= 0);
    
    card = input;
    
    while (input > 0)
    {
        ary[x] = input % 10;
        input = input / 10;
        x++;
    }
    
    for (int i = 0; i < x; i++)
    {
        if (ary[i] % 2 == 0)
        {
            continue;
        }
        else
        {
        total += ary[i] + (ary[i] * 2);
        }
    }
    
    if (total % 10 == 0)
    {
    /*
        if (ary[0] == 4)
        {
            printf("VISA\n");
        }
        else if (ary[0] == 3 && (ary[1] == 4 || ary[1] == 7))
        {
            printf("AMEX\n");
        }
        else if (ary[0] == 5 && (ary[1] > 0 && ary[1] < 6))
        {
            printf("MASTERCARD\n");
        } 
        else
        {
            printf("INVALID\n");
        }
        
    */
        printf("VALID\n");
    }
    
    else
    {
        printf("INVALID\n");
    }  
}
