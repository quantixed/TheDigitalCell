// set pxsize and tstep manually
// pxsize should match the original image
var pxsize = 0.069; // xy size in um
// tstep is the duration of the movie divided by the height of the kymograph in pixels
var tstep = 0.1; // seconds

// get the start and end points of straight line selection
getLine(x1, y1, x2, y2, lineWidth);
print("start ("+x1+" , "+y1+") - end ("+x2+" , "+y2+") ");

// calculation of speed.
dx = abs(x2-x1);
dy = abs(y2-y1);
dx *= pxsize;
dy *= tstep;
velocity = dx/dy;
print(dx+" um in "+dy+" sec");
print("Velocity (um/s) = "+ d2s(velocity, 3));