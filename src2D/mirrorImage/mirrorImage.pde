/* @pjs preload="toufuChan.jpg"; 
 */
String imagePath = "toufuChan.jpg";

PImage img;
size(1000, 500);
background(255);
img = loadImage(imagePath);

for(int i=0; i<img.width; i++) {
    for(int j=0; j<img.height; j++) {
        stroke(img.get(i, j));                 point(i, j);
        stroke(img.get(img.width - (i+1), j)); point(img.width + i, j);
    }
}
