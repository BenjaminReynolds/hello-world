#include <stdio.h>
#include <cs50.h>

int main(void)
{
    printf("minutes: ");
    int n = GetInt();
    printf("bottles: %i\n", n * 12);
}