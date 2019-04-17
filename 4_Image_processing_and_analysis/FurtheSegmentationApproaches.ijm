setAutoThreshold("Otsu");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Open");
run("Close-");
run("Outline");
run("Dilate");