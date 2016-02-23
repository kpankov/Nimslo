/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "combiner.h"

char gifLogicalScreen[13] = {'G', 'I', 'F', '8', '9', 'a', 0x80, 0x02, 0x80, 0x02, 0xF7, 0xFF, 0x00};
char gifExtGraphical[8] = {'!', 0xF9, 0x04, 0x08, 0x0A, 0x00, 0x00, 0x00};
char gifExtNetscape[19] = {'!', 0xFF, 0x0B, 'N', 'E', 'T', 'S', 'C', 'A', 'P', 'E', '2', '.', '0', 0x03, 0x01, 0x00, 0x00, 0x00};
char gifPalette[256][3];

int gifCombine(struct gifHeader header, unsigned int pause, unsigned char col, struct gifBody *body) {
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