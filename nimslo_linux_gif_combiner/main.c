/**
 * File: main.cpp
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#include <stdio.h>
#include <stdlib.h>

#include "combiner.h"

int main(int argc, char** argv) {
    struct gifFile Gifs[100]; //TODO: Fix size!
    unsigned int pause;
    volatile unsigned int i, errors;
    unsigned char gif_co = argc-3;

    /*if (argc != 7) {
        printf("Invalid parameters! Use: \n");
        printf("combiner [Pause - 1/100 of second] [File1] [File2] [File3] [File4] [outFile]\n");
        return 0;
    }*/

    if ((pause = strtoul(argv[1], NULL, 10)) <= 1000) {
        printf("Pause = %d\n", pause);
    } else {
        printf("Invalid pause!\n");
        return 0;
    }

    printf("Input files: ");
    for (i = 0; i < gif_co; i++) {
        setFilename(&Gifs[i], argv[2 + i]);
        printf("%s ", Gifs[i].filename);
    }
    printf("\n");

    printf("Output file: %s\n", argv[2+gif_co]);

    errors = 0;
    for (i = 0; i < gif_co; i++) {
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
    gifCombine(argv[2+gif_co],pause,gif_co,Gifs);

    printf("\n>>> OK <<<\n\n");

    return 0;
}
