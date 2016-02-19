/**
 * Main file of Nimslo-Linux project
 * @author Konstantin Pankov
 * @version 1.0 16/02/2016
 */

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/videoio.hpp"
#include <iostream>
#include <stdio.h>
#include <assert.h>

using namespace cv;
using namespace std;


#define CAM_NUM 3

void drawText(Mat & image, uchar number, String &caption);

int main() {
    cout << "Built with OpenCV " << CV_VERSION << endl;
    Mat image[CAM_NUM];
    VideoCapture capture[CAM_NUM];
    
    String caption;

    for (int i = 0; i < CAM_NUM; i++) {
        capture[i].open(i);

        if (capture[i].isOpened()) {
            cout << "Capture " << i << " is opened" << endl;

        } else {
            cout << "No capture" << endl;
            image[i] = Mat::zeros(480, 640, CV_8UC1);
            //drawText(image[i], i);
            imshow("Sample", image[i]);
            waitKey(0);
        }
    }

    while (1) {
        for (int i = 0; i < CAM_NUM; i++) {
            
            capture[i] >> image[i];
            if (image[i].empty())
                break;
            drawText(image[i], i, caption);
            namedWindow(caption, WINDOW_NORMAL);
            imshow(caption, image[i]);
            waitKey(25);
        }
    }

    return 0;

}

void drawText(Mat & image, uchar number, String &caption) {
    char s[6];
    //String str;
    sprintf(s, "CAM#%d", number);
    s[5] = 0;
    caption = s;
    putText(image, caption,
            Point(20, 50),
            FONT_HERSHEY_COMPLEX, 1, // font face and scale
            Scalar(255, 255, 255), // white
            1, LINE_AA); // line thickness and type
}
