/**
 * copy.c
 *
 * Computer Science 50
 * Problem Set 4
 *
 * Copies a BMP piece by piece, just because.
 */
       
#include <stdio.h>
#include <stdlib.h>

#include "bmp.h"

int main(int argc, char* argv[])
{
    // ensure proper usage
    if (argc != 4)
    {
        printf("Usage: ./resize n infile outfile\n");
        return 1;
    }

    // remember filenames
    char* infile = argv[2];
    char* outfile = argv[3];
    int size = atoi(argv[1]);

    // open input file 
    FILE* inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        printf("Could not open %s.\n", infile);
        return 2;
    }

    // open output file
    FILE* outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
    }

    // read infile's BITMAPFILEHEADER
    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

    // read infile's BITMAPINFOHEADER
    BITMAPINFOHEADER bi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);

    // ensure infile is (likely) a 24-bit uncompressed BMP 4.0
    if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 || 
        bi.biBitCount != 24 || bi.biCompression != 0)
    {
        fclose(outptr);
        fclose(inptr);
        fprintf(stderr, "Unsupported file format.\n");
        return 4;
    }
    
    // Save old values of BITMAPFILEHEADER and BITMAPINFOHEADER
    LONG  oldBiWidth = bi.biWidth;
    LONG  oldBiHeight = bi.biHeight;
    // DWORD oldBiSizeImage = bi.biSizeImage;
    // DWORD oldBfSize = bf.bfSize;
    
    //update values in BITMAPFILEHEADER and BITMAPINFOHEADER
    bi.biWidth = oldBiWidth * size;
    bi.biHeight = oldBiHeight * size;
    
    // determine padding for scanlines
    int oldPadding =  (4 - (oldBiWidth * sizeof(RGBTRIPLE)) % 4) % 4;
    
    // determine padding for resized image
    int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;

    bi.biSizeImage = abs(bi.biHeight) * (bi.biWidth * sizeof(RGBTRIPLE) + padding);
    bf.bfSize = bi.biSizeImage + bf.bfOffBits;
    
    // write outfile's BITMAPFILEHEADER
    fwrite(&bf, sizeof(BITMAPFILEHEADER), 1, outptr);

    // write outfile's BITMAPINFOHEADER
    fwrite(&bi, sizeof(BITMAPINFOHEADER), 1, outptr);

    /*
    // iterate over infile's scanlines
    for (int i = 0, biHeight = abs(oldBiHeight); i < biHeight; i++)
    {
        // read each scanline "size" times
        for (int n = 0; n < size; n++)
        {
            // if the scanline has already been read,
            // reset file read position to the begining of the scanline
            if (n != 0)
            {
                fseek(inptr, -(oldBiWidth), SEEK_CUR);
            }
        
            // iterate over pixels in scanline
            for (int j = 0; j < oldBiWidth; j++)
            {
                // temporary storage
                RGBTRIPLE triple;
    
                // read RGB triple from infile
                fread(&triple, sizeof(RGBTRIPLE), 1, inptr);
                
                // write each RGB triple "size" times
                for (int x = 0; x < size; x++)
                {
                    // write RGB triple to outfile
                    fwrite(&triple, sizeof(RGBTRIPLE), 1, outptr);
                }
                
            }
            
            // add padding to resized image, if any
            for (int k = 0; k < padding; k++)
            {
                fputc(0x00, outptr);
            }
        
        }
        
        // skip over padding, if any
        fseek(inptr, oldPadding, SEEK_CUR);
        
    } */
    // length in bytes of one scanline of the out-file
    int length = bi.biWidth * sizeof(RGBTRIPLE) + padding;
    
    // iterate over infile's scanlines
    for (int i = 0, biHeight = abs(oldBiHeight); i < biHeight; i++)
    {
        // create an array to store the bytes to write one line of the out-file
        BYTE line[length];
        
        // keep track of where we are in the array
        int p = 0;
        
        // iterate over pixels in scanline
        for (int j = 1; j <= oldBiWidth; j++)
        {
            
            // temporary storage
            RGBTRIPLE triple;

            // read RGB triple from infile
            fread(&triple, sizeof(RGBTRIPLE), 1, inptr);
            
            for (int l = 0; l < size; l++)
            {
                line[p] = triple.rgbtBlue;
                line[p + 1] = triple.rgbtGreen;
                line[p + 2] = triple.rgbtRed;
                p += 3;
            }
        }

        // skip over padding, if any
        fseek(inptr, oldPadding, SEEK_CUR);

        // then add it back (to demonstrate how)
        for (int k = 0; k < padding; k++)
        {
            line[p] = 0x00;
            p++;
        }
        
        // write to the file, rinse and repeat
        for (int x = 0; x < size; x++)
        {
            fwrite(line, sizeof(line), 1, outptr);
        }
    }

    // close infile
    fclose(inptr);

    // close outfile
    fclose(outptr);

    // that's all folks
    return 0;
}
