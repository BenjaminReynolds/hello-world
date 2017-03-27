/**
 * generate.c
 *
 * Computer Science 50
 * Problem Set 3
 *
 * Generates pseudorandom numbers in [0,LIMIT), one per line.
 *
 * Usage: generate n [s]
 *
 * where n is number of pseudorandom numbers to print
 * and s is an optional seed
 */
 
#define _XOPEN_SOURCE

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// constant
#define LIMIT 65536

int main(int argc, string argv[])
{
    /**
     * check the number of command line arguments to ensure that the program was
     * run correctly. If the number of command line arguments is incorrect,
     * display a message to the user showing the correct usage of the program
     */
    if (argc != 2 && argc != 3)
    {
        printf("Usage: generate n [s]\n");
        return 1;
    }

    /**
     * convert the first command line argument (other than the name of the 
     * program itself) from a string to an int
     */
    int n = atoi(argv[1]);

    /**
     * If a second command line argument is present (other than the name of the
     * program itself) seed future calls of drand with that comman line argument
     * (converted to an integer), if no seed value is given seed with the number
     * of seconds since epoch (current time)
     */
    if (argc == 3)
    {
        srand48((long int) atoi(argv[2]));
    }
    else
    {
        srand48((long int) time(NULL));
    }

    /**
     * generate n pseodorandom numbers using a seed value of x, where n is the 
     * first command line argument given to the program, and x is either the 
     * second command line argument given, or the current time in seconds from 
     * epoch (see above), print these numbers to the screen
     */
    for (int i = 0; i < n; i++)
    {
        printf("%i\n", (int) (drand48() * LIMIT));
    }

    // success
    return 0;
}