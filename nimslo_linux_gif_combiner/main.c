/**
 * File: main.cpp
 * @author: Konstantin Pankov
 * @version: 1.0 23/02/2016
 */

#include <stdio.h>
#include <stdlib.h>

#include "combiner.h"

int main(int argc, char** argv) {
    int pause;

    if (argc != 7) {
        printf("Invalid parameters! Use: \n");
        printf("combiner [Pause - 1/100 of second] [File1] [File2] [File3] [File4] [outFile]\n");
        return 0;
    }

    if (( pause = strtoul(argv[1], NULL, 10) ) <= 1000) {
        printf("Pause = %d\n", pause);
    } else {
        printf("Invalid pause!\n");
        return 0;
    }

    printf("Input files: %s %s %s %s\n",argv[2],argv[3],argv[4],argv[5]);
    printf("Output file: %s\n",argv[6]);
    
    printf("\n>>> OK <<<\n\n");

    return 0;
}
