/**
 * recover.c
 *
 * Computer Science 50
 * Problem Set 4
 *
 * Recovers JPEGs from a forensic image.
 */
 
 #include <stdint.h>
 #include <stdio.h>
 #include <cs50.h>

typedef uint8_t BYTE;
typedef uint8_t REST[508]; 

typedef struct
{
    BYTE    first;
    BYTE    second;
    BYTE    third;
    BYTE    fourth;
    REST    restBlock;
}
BLOCK;

bool blockCheck(BLOCK toTest);

int main(int argc, char* argv[])
{
    
    FILE* infile = fopen("card.raw", "r");
    BLOCK buffer;
    int counter = 0;
    fread(&buffer, sizeof(BLOCK), 1, infile);
    
    while (1)
    {
        if (blockCheck(buffer))
        {
            char title[7];
            sprintf(title, "%d.jpg", counter);
            counter += 1;
            FILE* outfile = fopen(title, "a");
            do
            {
                fwrite(&buffer, sizeof(BLOCK), 1, outfile);
                if (fread(&buffer, sizeof(BLOCK), 1, infile) != 1)
                {
                    break;
                }
            }
            while (!blockCheck(buffer));
            fclose(outfile);
        }
        else
        {
            fread(&buffer, sizeof(BLOCK), 1, infile);
        }
    }
    fclose(infile);
    
    return 0;
}

bool blockCheck(BLOCK toTest)
{
    if (toTest.first == 0xff &&
        toTest.second == 0xd8 &&
        toTest.third == 0xff &&
        toTest.fourth >= 0xe0 &&
        toTest.fourth <= 0xef)
        {
            return true;
        }
        else
        {
            return false;
        }
}