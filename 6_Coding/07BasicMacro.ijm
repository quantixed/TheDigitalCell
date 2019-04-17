/*
* Comments here are useful to describe the macro
* This macro will measure the mean of each image in a folder
*/
// Prompt user to select the folder with images
dir = getDirectory("Select the source directory");
// Make a list of all files in this directory
list = getFileList(dir);
// Sort the file list alphabetically
Array.sort(list);
// Use batch mode: speeds up execution.
setBatchMode(true);
// Define measurements we want
run("Set Measurements...", "display area mean redirect=None decimal=3");
// use a loop to run command(s) on each image
for(i=0; i<list.length; i++){
	// define the ith file in the list and open it
	filename = dir + list[i];
	open(filename);
	// run these commands on each image
	run("Select All");
	run("Measure");
	run("Close All");
	}
