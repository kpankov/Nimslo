/**
 * File: combiner.h
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#ifndef COMBINER_H
#define COMBINER_H

struct gifHeader {
    char magic[6];
    unsigned short width, height, paletteSize;
    unsigned char palette[256][3];
};

struct gifFile {
    char *filename;
    long int lzwPosition;
    struct gifHeader header;
};

int gifCombine(char *filename, unsigned int pause, unsigned char col, struct gifFile *gif);
int gifOpen(struct gifFile *gif);

void gifSetDelay(unsigned int delay);
void gifSetSize(unsigned int Width, unsigned int Height);

void setFilename(struct gifFile *gif, const char *filename);

#endif /* COMBINER_H */

