/*
 * Make a test image and a ground truth image to compare.
 * Ten spots on a gray noisy background
 */
setBatchMode(true);
imageDim=512;	// xy Dimensions of images in pixels
// make an image of noise
newImage("TestImg", "8-bit random", imageDim, imageDim, 1);
// apply a mean filter
run("Mean...", "radius=2");
// retrieve the ID of the TestImg window
Tid = getImageID();
// make a black background ground truth image
newImage("GTImg", "8-bit grayscale-mode black", imageDim, imageDim, 1);
// retrieve the ID of the GTImg window
GTid = getImageID();
// set foreground color to white
setColor(255);
// in a loop, position spots on each image
for (i=0;i<10;i++){
	// random position in the image
	posX=floor(random*imageDim);
	posY=floor(random*imageDim);
	selectImage(Tid);
	// fill a 5-pixel circle at this position
	fillOval(posX, posY, 3, 3);
	selectImage(GTid);
	// do the same in ground truth image
	fillOval(posX, posY, 3, 3);
}
selectImage(Tid);
// blur the whole test image
run("Gaussian Blur...", "sigma=2 stack");
setBatchMode("exit and display");