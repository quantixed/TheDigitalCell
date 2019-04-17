/*
* This macro will save a binarized version of each image in a new folder
*/
dir1 = getDirectory("Select the source directory");
// User must now also pick a destination folder
dir2 = getDirectory("Select destination directory");
list = getFileList(dir1);
Array.sort(list);
setBatchMode(true);
for(i=0; i<list.length; i++){
	filename = dir1 + list[i];
	// check we are dealing with a tiff file
	if (endsWith(filename, "tif")) {
		open(filename);
		// use a function to do the operations for each image
		processImage();
		// now save the modified image in the destination folder
		saveAs("TIFF", dir2+list[i]);
		close();
		}
	}
function processImage() {
	setAutoThreshold("Otsu");
	setOption("BlackBackground", false);
	run("Convert to Mask");
	}
