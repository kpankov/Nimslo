/**
 * File: combiner.h
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#ifndef COMBINER_H
#define COMBINER_H

struct gifHeader {};
struct gifBody {
    char *name; //?
};

int gifCombine(struct gifHeader header, unsigned int pause, unsigned char col, struct gifBody *body);

void gifSetDelay(unsigned int delay);

void gifSetSize(unsigned int Width, unsigned int Height);

#endif /* COMBINER_H */

