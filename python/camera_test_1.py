import numpy as np
import cv2

cap0 = cv2.VideoCapture(0)
cap1 = cv2.VideoCapture(1)
cap2 = cv2.VideoCapture(2)
#cap3 = cv2.VideoCapture(3)

while(True):
    # Capture frame-by-frame
    ret, frame0 = cap0.read()
    ret, frame1 = cap1.read()
    ret, frame2 = cap2.read()
    #ret, frame3 = cap0.read()

    # Our operations on the frame come here
    gray0 = cv2.cvtColor(frame0, cv2.COLOR_BGR2GRAY)
    gray1 = cv2.cvtColor(frame1, cv2.COLOR_BGR2GRAY)
    gray2 = cv2.cvtColor(frame2, cv2.COLOR_BGR2GRAY)
    #gray3 = cv2.cvtColor(frame3, cv2.COLOR_BGR2GRAY)

    # Display the resulting frame
    cv2.imshow('frame0',gray0)
    cv2.imshow('frame1',gray1)
    cv2.imshow('frame2',gray2)
    #cv2.imshow('frame3',gray3)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap0.release()
cap1.release()
cap2.release()
#cap3.release()
cv2.destroyAllWindows()