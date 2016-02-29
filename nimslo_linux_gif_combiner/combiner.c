/**
 * File: combiner.cpp
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

//TODO: Filename long MUST be less then 99 symbols! Add check of it's true.

#include "combiner.h"
#include <stdio.h>
#include <string.h>
#include <malloc.h>

char gifLogicalScreen[13] = {'G', 'I', 'F', '8', '9', 'a', 0x80, 0x02, 0x80, 0x02, 0x70, 0x00, 0x00};
char gifExtGraphical[8] = {'!', 0xF9, 0x04, 0x08, 0x0A, 0x00, 0x00, 0x00}; // Extention of graphical control
char gifExtNetscape[19] = {'!', 0xFF, 0x0B, 'N', 'E', 'T', 'S', 'C', 'A', 'P', 'E', '2', '.', '0', 0x03, 0x01, 0x00, 0x00, 0x00};

int gifCombine(char *filename, unsigned int pause, unsigned char col, struct gifFile *gif) {
    FILE *fp;
    volatile unsigned int i;

    for (i = 1; i < col; i++) {
        if (!((gif[i - 1].header.width == gif[i].header.width)&&(gif[i - 1].header.height == gif[i].header.height))) {
            printf("Warning: Width or Height of files is not equal!\n");
            return 0;
        }
    }

    gifSetSize(gif[0].header.width, gif[0].header.height);
    gifSetDelay(pause);

    fp = fopen(filename, "w");

    if (fp == NULL) {
        printf("Can't open output file %s\n", filename);
        return 0;
    }

    for (i = 0; i<sizeof (gifLogicalScreen); i++) {
        putc(gifLogicalScreen[i], fp);
    }

    for (i = 0; i<sizeof (gifExtNetscape); i++) {
        putc(gifExtNetscape[i], fp);
    }

    for (i = 0; i<sizeof (gifExtGraphical); i++) {
        putc(gifExtGraphical[i], fp);
    }

    for (i = 0; i < col; i++) {
        putc(',', fp);/// Start of Image
        
        putc(0x00, fp); // Top
        putc(0x00, fp); // Top
        putc(0x00, fp); // Left
        putc(0x00, fp); // Left
        
        putc(Width & 0xFF, fp);
        putc((Width >> 8) & 0xFF, fp);
        putc(Height & 0xFF, fp);
        putc((Height >> 8) & 0xFF, fp);
        
        putc(0x87, fp); // Flags
        
        // TODO: Local pattern here
        
        putc(0x08, fp); // MC
        
        // TODO: LZW here
        
        putc(0x00, fp); /// End of Image
    }

    putc(';', fp); /// End of GIF

    fclose(fp);

    return 1;
}

int gifOpen(struct gifFile *gif) {
    FILE *fp;
    FILE *fpHtml;
    volatile unsigned int i;

    char buf[100];

    unsigned char lsd, blockS;
    unsigned int blockCounter;

    printf("\nFile %s ---------------------------------------------\n", gif->filename);

    fp = fopen(gif->filename, "r");

    if (fp == NULL) {
        printf("Can't open file %s\n", gif->filename);
        return 0;
    }

    fscanf(fp, "%6s", gif->header.magic);

    if (gif->header.magic[0] == 'G' && gif->header.magic[1] == 'I' && gif->header.magic[2] == 'F') { // REFACTOR IT!!!
        printf("Magic:  %s\n", gif->header.magic);
    } else {
        printf("Not a GIF file!\n");
        return 0;
    }

    gif->header.width = getc(fp);
    gif->header.width |= (getc(fp) << 8);

    gif->header.height = getc(fp);
    gif->header.height |= (getc(fp) << 8);

    printf("Width:  %d px\n", gif->header.width);
    printf("Height: %d px\n", gif->header.height);

    lsd = getc(fp);

    printf("Global palette: ");
    if (lsd >> 7) printf("yes");
    else printf("no");
    printf("\n");

    printf("Source colors: %d bit/pixel\n", (((unsigned char) ((lsd & 0x70) >> 4) + 1)*3));

    gif->header.paletteSize = (unsigned int) (2 << (unsigned char) (lsd & 0x07));
    printf("Palette size: %d\n", gif->header.paletteSize);

    getc(fp); // TODO: BG
    getc(fp); // TODO: R

    sprintf(buf, "global_palette_%s.html", gif->filename);
    fpHtml = fopen(buf, "w");
    fprintf(fpHtml, "<html>\n<head>\n<title>Global Palette of %s</title>\n<head/>\n<body>\n<table border=0 cellspacing=0 cellpadding=0 style=\"border-collapse:collapse;\">\n", gif->filename);
    for (i = 0; i < gif->header.paletteSize; i++) {
        gif->header.palette[i][0] = getc(fp); // Red
        gif->header.palette[i][1] = getc(fp); // Green
        gif->header.palette[i][2] = getc(fp); // Blue
        fprintf(fpHtml, "<tr>");
        fprintf(fpHtml, "<td style=\"font-size: 8px;\">%d</td>\n", i / 3);
        fprintf(fpHtml, "<td style=\"width:100px; height:10px; border: 1px solid #000; background-color:#%02x%02x%02x;\"></td>", gif->header.palette[i][0], gif->header.palette[i][1], gif->header.palette[i][2]);
        fprintf(fpHtml, "<td style=\"font-size: 8px;\">&nbsp;0x%02X%02X%02X</td>\n", gif->header.palette[i][0], gif->header.palette[i][1], gif->header.palette[i][2]);
        fprintf(fpHtml, "</tr>");
    }
    fprintf(fpHtml, "</table>\n</body>\n</html>\n");
    fclose(fpHtml);


    if (getc(fp) == ',') printf("Global palette is correct. See it in file: %s\n", buf);
    else printf("Error!\n");

    getc(fp); // TODO: Left
    getc(fp); // TODO: Left
    getc(fp); // TODO: Top
    getc(fp); // TODO: Top
    getc(fp); // TODO: W
    getc(fp); // TODO: W
    getc(fp); // TODO: H
    getc(fp); // TODO: H
    getc(fp); // TODO: Image descriptor

    printf("MC: 0x%02X\n", getc(fp)); // TODO: MC

    blockCounter = 0;
    while (1) {
        blockS = getc(fp);
        //printf("S: 0x%02X\n", blockS); // TODO: S
        for (i = 0; i < blockS; i++) {
            getc(fp); // TODO: store it
        }
        blockCounter++;
        if (blockS != 0xFE)
            break;
    }

    if (getc(fp) == 0 && getc(fp) == ';') {
        printf("File successfully parsed.\n");
        printf("%d blocks read.\n", blockCounter);
    } else {
        printf("ERROR: Read blocks error or wrong GIF87a file format!\n");
        return 0;
    }

    fclose(fp);

    printf("File %s success -------------------------------------\n", gif->filename);

    return 1;
}

/// Coming soon

int gifSave(const char *filename, char *buffer, unsigned int size) {
    FILE *fp;

    fp = fopen(filename, "w+");

    if (fp == NULL) {
        printf("Can't open output file %s\n", filename);
        return 0;
    }

    printf("Open file %s\n", filename);

    fclose(fp);

    return 0;
}

void gifSetDelay(unsigned int delay) {
    gifExtGraphical[4] = delay & 0xFF;
    gifExtGraphical[5] = (delay >> 8) & 0xFF;
}

void gifSetSize(unsigned int Width, unsigned int Height) {
    gifLogicalScreen[6] = Width & 0xFF;
    gifLogicalScreen[7] = (Width >> 8) & 0xFF;
    gifLogicalScreen[8] = Height & 0xFF;
    gifLogicalScreen[9] = (Height >> 8) & 0xFF;
}

void setFilename(struct gifFile *gif, const char *filename) {
    gif->filename = (char *) filename;
}