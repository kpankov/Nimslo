/**
 * File: main.cpp
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#include <stdio.h>
#include <stdlib.h>

#include "combiner.h"

#define GIFS 4

int main(int argc, char** argv) {
    struct gifFile Gifs[GIFS];
    unsigned int pause;
    volatile unsigned int i, errors;

    if (argc != 7) {
        printf("Invalid parameters! Use: \n");
        printf("combiner [Pause - 1/100 of second] [File1] [File2] [File3] [File4] [outFile]\n");
        return 0;
    }

    if ((pause = strtoul(argv[1], NULL, 10)) <= 1000) {
        printf("Pause = %d\n", pause);
    } else {
        printf("Invalid pause!\n");
        return 0;
    }

    printf("Input files: ");
    for (i = 0; i < GIFS; i++) {
        setFilename(&Gifs[i], argv[2 + i]);
        printf("%s ", Gifs[i].filename);
    }
    printf("\n");

    printf("Output file: %s\n", argv[6]);

    errors = 0;
    for (i = 0; i < GIFS; i++) {
        if (!gifOpen(&Gifs[i])) {
            errors++;
        }
    }
    
    printf("\n");
    
    if (errors) {
        printf("Read files error!\n");
        return 0;
    } else {
        printf("Read files OK.\n");
    }
    
    printf("Combining...\n");
    gifCombine(argv[2+GIFS],pause,GIFS,Gifs);

    printf("\n>>> OK <<<\n\n");

    return 0;
}
