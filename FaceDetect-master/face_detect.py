import cv2
import sys

# func to identify the major face out of several recognized faces
def findMajorFace(arr):
	area = 0
	index = 0
	for i in range(arr.shape[1]):
		if arr[i][2]*arr[i][3] > area:
			area = arr[i][2]*arr[i][3]
			index = i		
	return arr[index]

#distinguish the face by taking the central 80% of the image
def extractFace(face,percentage):
	face[0] = face[0]+face[2]*(1-percentage)/2
	face[1] = face[1]+face[3]*(1-percentage)/2
	face[2] = face[2]*percentage
	face[3] = face[3]*percentage


# Get user supplied values
imagePath = sys.argv[1]
cascPath = sys.argv[2]
outputPath = sys.argv[3]

#get the image name 
#temp = imagePath.split('/')
#imageName = temp[len(temp)-1]

#"haarcascade_frontalface_default.xml"

# Create the haar cascade
faceCascade = cv2.CascadeClassifier(cascPath)

# Read the image
image = cv2.imread(imagePath)
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Detect faces in the image
faces = faceCascade.detectMultiScale(
    gray,
    scaleFactor=1.1,
    minNeighbors=5,
    minSize=(30, 30),
#    flags = cv2.cv.CV_HAAR_SCALE_IMAGE
)

#print faces
# detect if found 
if(len(faces)==0 ):
	print "no faces found"
# more than one faces found, only take the major 
if(len(faces)>=1):
	#print "found",len(faces), "faces, only take the major one"
	if faces.size == 4:
		f = faces[0]
	else:
		f = findMajorFace(faces)
	extractFace(f,.8)   # face size is set to be 0.8
	print outputPath
	cv2.imwrite(outputPath,image[f[1]:f[1]+f[3],f[0]:f[0]+f[2]],[int(cv2.IMWRITE_JPEG_QUALITY),200])
