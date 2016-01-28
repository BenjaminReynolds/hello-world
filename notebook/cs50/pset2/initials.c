#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    
    // Get the users input and store it in a variable
    
    string name = GetString();
    
    /**
    *   Iterate over the string the user gave us one character at a time.
    *   If the character at the current index is the first character of the
    *   string, or the previous character is a space, print the character.
    **/
    for (int i = 0, n = strlen(s) ;i < n; i++)
    {
        if (name[i - 1] == ' ' || i == 0)
        {
            // If the character is already uppercased, print it as is.
            if (name[i] < 97)
            {
                printf("%c", name[i]);    
            }
            // otherwise, convert the character to an uppercase letter
            else
            {
                printf("%c", name[i] - 32);
            }
        }
    }
    printf("\n");
}