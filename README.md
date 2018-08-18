# DL_vgg_face_recognition

This is my personal project about the training result of VGG based on a small dataset of face images.
The training process takes about 1 day on GPU OR several days on CPU.

"FaceDetect-master/CASIA_WebFace" contains some raw sample data for training, all images of the same person are
placed under a directory with its own tag nunmber. Under "Detect-master", there are also some bash script files for 
manipulating files and detecting faces on raw data.

"vgg_deploy.prototxt", "vgg_solver.prototxt", and "vgg_train_val.prototxt" are configuation files for training.
The training process is completed using Caffe.

I modified the last layer, called "soft-max" to output a list of features instead a value representing the training accuracy.
So that is testing, by feeding in an image of a person, the VGG model will output a list of features.
By comparing the list of features with the original list of features of that person, the python file under  "VGG feature output-- testing accuracy" can calculate the cos distance of the list of features, and then output the similarity of the two feed in image.

Due to the restriction of limit size of files to upload is 100 MB and "vggfeature.txt" is out of size, it was not pushed to github.
