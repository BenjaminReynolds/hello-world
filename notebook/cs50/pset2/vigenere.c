#include <stdio.h>
#include <cs50.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(int argc, string argv[])
{
    int k;
    // Ensure that the correct number of command line inputs were given
    if (argc == 2)
    {
        k = strlen(argv[1]);
        for (int i = 0; i < k; i++)
        {
            if (!isalpha(argv[1][i]))
            {
                printf("Please provide input in the form of one non-negative integer.\n");
                return 1;
            }
        }
    }
    else
    {
        printf("Please provide input in the form of one non-negative integer.\n");
        return 1;
    }
    
    string key = argv[1];
    
    for (int i = 0; i < k; i++)
    {
        key[i] = toupper(key[i]);
    }
    
    string message = GetString();
    
    /**
    * Loops through the message to by encrypted, if the character at the 
    * current index is a letter in the alphabet, the letter will be shifted
    * positively using the key provided at the command line. If the character is
    * not a letter, the character will be printed as is. A different algorithm 
    * is implemented depending on whether the letter is uppercase or lowercase.
    **/
    
    for (int i = 0, j = 0, n = strlen(message); i < n; i++)
    {
        if (isalpha(message[i]))
        {
            if (isupper(message[i]))
            {
                printf("%c", ((message[i] - 'A' + (key[j % k] - 'A')) % 26) + 'A');
            }
            else
            {
                printf("%c", ((message[i] - 'a' + (key[j % k] - 'A')) % 26) + 'a');
            }
            j++;
        }
        else
        {
            printf("%c", message[i]);
        }
    }
    printf("\n");
}