#include <stdio.h>
#include <cs50.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(int argc, string argv[])
{
    
    // Ensure that the correct number of command line inputs were given
    
    if (argc != 2)
    {
        printf("Please provide input in the form of one non-negative integer.\n");
        return 1;
    }
    
    // Converts command line argument from string to an integer less than 26
    
    int k = atoi(argv[1]);
    k = k % 26;
    
    // Gets input from the user to by encrypted
    
    string message = GetString();
    
    /**
    * Loops through the message to by encrypted, if the character at the 
    * current index is a letter in the alphabet, the letter will be shifted
    * positively using the key provided at the command line. If the character is
    * not a letter, the character will be printed as is. A different algorithm 
    * is implemented depending on whether the letter is uppercase or lowercase.
    **/
    
    for (int i = 0, n = strlen(message); i < n; i++)
    {
        if (isalpha(message[i]) && isupper(message[i]))
        {
            printf("%c", ((message[i] - 'A' + k) % 26) + 'A');
        }
        else if (isalpha(message[i]) && islower(message[i]))
        {
            printf("%c", ((message[i] - 'a' + k) % 26) + 'a');
        }
        else
        {
            printf("%c", message[i]);
        }
    }
    printf("\n");
}