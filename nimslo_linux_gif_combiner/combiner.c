/**
 * File: combiner.cpp
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#include "combiner.h"
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <malloc.h>

char gifLogicalScreen[13] = {'G', 'I', 'F', '8', '9', 'a', 0x80, 0x02, 0x80, 0x02, 0xF7, 0xFF, 0x00};
char gifExtGraphical[8] = {'!', 0xF9, 0x04, 0x08, 0x0A, 0x00, 0x00, 0x00};
char gifExtNetscape[19] = {'!', 0xFF, 0x0B, 'N', 'E', 'T', 'S', 'C', 'A', 'P', 'E', '2', '.', '0', 0x03, 0x01, 0x00, 0x00, 0x00};
char gifPalette[256][3];

int gifCombine(struct gifHeader header, unsigned int pause, unsigned char col, struct gifBody *body) {
    return 0;
}

int gifOpen(const char *filename) {
    FILE *fp;
    FILE *fpHtml;
    unsigned int i;

    char magic[7];

    unsigned short width, height, paletteSize;
    unsigned char lsd;

    printf("\nFile %s ---------------------------------------------\n", filename);

    fp = fopen(filename, "r");

    if (fp == NULL) {
        printf("Can't open file %s\n", filename);
        return -1;
    }

    fscanf(fp, "%6s", magic);
    magic[6] = '\0';

    if (magic[0] == 'G' && magic[1] == 'I' && magic[2] == 'F') {
        printf("Magic:  %s\n", magic);
    } else {
        printf("Not a GIF file!\n");
        return -1;
    }

    width = getc(fp);
    width |= (getc(fp) << 8);

    height = getc(fp);
    height |= (getc(fp) << 8);

    printf("Width:  %d px\n", width);
    printf("Height: %d px\n", height);

    lsd = getc(fp);

    printf("Global palette: ");
    if (lsd >> 7) printf("yes");
    else printf("no");
    printf("\n");

    printf("Source colors: %d bit/pixel\n", (((unsigned char) ((lsd & 0x70) >> 4) + 1)*3));

    paletteSize = (unsigned int) pow(2, ((unsigned char) (lsd & 0x07) + 1));
    printf("Palette size: %d\n", paletteSize);

    getc(fp); // TODO: BG
    getc(fp); // TODO: R

    unsigned char *palette = (unsigned char *) malloc(paletteSize * 3);

    fpHtml = fopen("global_palette.html", "w");
    fprintf(fpHtml, "<html>\n<head>\n<title>Global Palette</title>\n<head/>\n<body>\n<table>\n");
    for (i = 0; i < paletteSize * 3; i += 3) {
        palette[i] = getc(fp);
        palette[i + 1] = getc(fp);
        palette[i + 2] = getc(fp);
        fprintf(fpHtml, "<tr><td>%d</td><td style=\"width:30px; background-color:#%02x%02x%02x;\"></td></tr>",
                i / 3, palette[i], palette[i + 1], palette[i + 2]);
    }
    fclose(fpHtml);
    fprintf(fpHtml, "</table>\n</body>\n</html>\n");


    if (getc(fp) == ',') printf("Global palette is correct. See it in file global_palette.html\n");
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

    getc(fp); // TODO: MC

    getc(fp); // TODO: S


    fclose(fp);

    return 0;
}

int gifSave(const char *filename, char *buffer, unsigned int size) {
    FILE *fp;

    fp = fopen(filename, "w+");

    if (fp == NULL) {
        printf("Can't open output file %s\n", filename);
        return -1;
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