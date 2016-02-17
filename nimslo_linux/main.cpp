/**
 * Main file of Nimslo-Linux project
 * @author Konstantin Pankov
 * @version 1.0 16/02/2016
 */

#include "main.hpp"

using namespace cv;

/**
 * Main function...
 * @param argc
 * @param argv
 * @return 
 */
int main(int argc, char **argv) {

    if (argc != 2) {
        printf("usage: DisplayImage.out <Image_Path>\n");
        return -1;
    }

    Mat image;
    image = imread(argv[1], 1);

    if (!image.data) {
        printf("No image data \n");
        return -1;
    }
    namedWindow("Display Image", WINDOW_AUTOSIZE);
    imshow("Display Image", image);

    waitKey(0);

    return 0;
}