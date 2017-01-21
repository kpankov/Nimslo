#include <stdlib.h>
#include <stdio.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <iostream>
#include <unistd.h>
#include <pthread.h>

using namespace cv;
using namespace std;

#define CAMERAS 4
#define MAX_LEN 64

void * threadCamera(void * thread_data) {
  unsigned char * id = (unsigned char *) thread_data;

  CvCapture * capture;
  IplImage * img;

  char filename[MAX_LEN];
  char *filename_ptr;

  capture = cvCreateCameraCapture(*id);
  cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_WIDTH, 1600);
  cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_HEIGHT, 1200);

  img = cvQueryFrame(capture);
  if (!capture) perror((char*) "No Capture");

  snprintf(filename, MAX_LEN, "img%d.jpg", *id);
  filename_ptr = filename;
  cvSaveImage(filename_ptr, img);

  cvReleaseCapture(&capture);

  pthread_exit(0);
}

int main(int argc, char **argv) {
  unsigned char ids[CAMERAS] = {0, 1, 2, 3};
  pthread_t thread[CAMERAS];
  
  pthread_create(&thread[0], NULL, threadCamera, &ids[0]);
  pthread_create(&thread[1], NULL, threadCamera, &ids[1]);
  pthread_create(&thread[2], NULL, threadCamera, &ids[2]);
  pthread_create(&thread[3], NULL, threadCamera, &ids[3]);

  pthread_join(thread[0], NULL);
  pthread_join(thread[1], NULL);
  pthread_join(thread[2], NULL);
  pthread_join(thread[3], NULL);

  return 0;
}
