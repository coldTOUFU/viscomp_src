/* @pjs preload="toufuChan.jpg"; 
 */
String imagePath = "toufuChan.jpg";

PImage img;
size(1500, 500);
background(255);
img = loadImage(imagePath);

int halfW = img.width/2;

for(int i=0; i<halfW; i++) {
    for(int j=0; j<img.height; j++) {
        stroke(img.get(i, j));             point(i, j);
        stroke(img.get(i + halfW, j));     point(i + halfW, j);

        stroke(img.get(i, j));             point(i + halfW*2, j);
        stroke(img.get(halfW - i, j));     point(i + halfW*3, j);
        
        stroke(img.get(halfW*2 - i, j));       point(i + halfW*4, j);
        stroke(img.get(i + halfW, j));     point(i + halfW*5, j);
        
    }
}
