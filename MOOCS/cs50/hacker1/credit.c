#include <stdio.h>
#include <cs50.h>

#define AMEX1 34
#define AMEX2 37
#define MASTERCARD_MIN 51
#define MASTERCARD_MAX 55
#define VISA_MIN 40
#define VISA_MAX 49
#define AMEX_LENGTH 15
#define MASTERCARD_LENGTH 16
#define VISA_LENGTH1 13
#define VISA_LENGTH2 16

int main(void)
{
    
    // declare variables
    
    long long card;
    int first_two = 0;
    int total = 0;
    int length = 0;
    bool flag = false;
    
    // get and validate user input
    
    do
    {
        printf("Number: ");
        card = GetLongLong();
    }
    while (card < 1);
    
    while (card > 0)
    {
        int n = card % 10;
        
        if (card < 100 && card > 9)
        {
            first_two = n;
        }
        else if (card <= 9)
        {
            first_two += (n * 10);
        }
        if (flag)
        {
            n *= 2;
            if (n > 9)
            {
                n = (n % 10) + (n / 10);
            }
            flag = false;
        }
        else
        {
            flag = true;
        }
        
        total += n;
        card /= 10;
        length++;
        
    }
    
    if (total % 10 == 0)
    {
        if ((length == VISA_LENGTH1 || length == VISA_LENGTH2) &&
            (first_two >= VISA_MIN && first_two <= VISA_MAX))
        {
            printf("VISA\n");
        }
        else if ((length == MASTERCARD_LENGTH) && 
                (first_two >= MASTERCARD_MIN && first_two <= MASTERCARD_MAX))
        {
            printf("MASTERCARD\n");    
        }
        else if ((length == AMEX_LENGTH) && 
                (first_two == AMEX1 || first_two == AMEX2))
        {
            printf("AMEX\n");
        }
        else
        {
            printf("INVALID\n");
        }
    }
    else
    {
        printf("INVALID\n");
    }
}