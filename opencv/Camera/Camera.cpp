#include <stdlib.h>
#include <stdio.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <iostream>

using namespace cv;
using namespace std;

#define CAMERAS 4
#define MAX_LEN 64

int main(int argc, char **argv) {
  CvCapture * capture[CAMERAS];
  IplImage *img;
  char filename[MAX_LEN];
  char * filename_ptr;
  
  cout << "cvCreateCameraCapture()" << endl;
  for (int i = 0; i < CAMERAS; i++) {
    capture[i] = cvCreateCameraCapture(i);
    cvSetCaptureProperty(capture[i], CV_CAP_PROP_FRAME_WIDTH, 1600);
    cvSetCaptureProperty(capture[i], CV_CAP_PROP_FRAME_HEIGHT, 1200);
  }

  cout << "cvQueryFrame()" << endl;
  for (int i = 0; i < CAMERAS; i++) {
    cout << "Frame " << i << endl;
    
    cout << "cvQueryFrame() #" << i << endl;
    img = cvQueryFrame(capture[i]);
    if (!capture[i]) perror((char*) "No Capture");
    
    cout << "cvSaveImage() #" << i << endl;
    snprintf(filename, MAX_LEN, "img%d.jpg", i);
    filename_ptr = filename;
    cvSaveImage(filename_ptr, img);
    
    cout << "cvReleaseCapture()" << endl;
    cvReleaseCapture(&capture[i]);
  }
  
  return 0;
}
