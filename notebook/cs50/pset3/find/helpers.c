/**
 * helpers.c
 *
 * Computer Science 50
 * Problem Set 3
 *
 * Helper functions for Problem Set 3.
 */
       
#include <cs50.h>

#include "helpers.h"

/**
 * Returns true if value is in array of n values, else false.
 */
bool search(int value, int values[], int n)
{
    int min = 0, max = n - 1;
    while (min <= max)
    {
        int mid = (max + min) / 2;
        if (values[mid] == value)
        {
            return true;
        }
        else if(values[mid] < value)
        {
            min = mid + 1;
        }
        else
        {
            max = mid - 1;
        }
    }
    return false;
}

/**
 * Sorts array of n values.
 */
void sort(int values[], int n)
{
    int min = 0;
    for (int i = 0; i < n; i++)
    {
        min = i;
        for (int j = i; j < n; j++)
        {
            if (values[j] < values[min])
            {
                min = j;
            }
        }
        int tmp = values[i];
        values[i] = values[min];
        values[min] = tmp;
    }
}