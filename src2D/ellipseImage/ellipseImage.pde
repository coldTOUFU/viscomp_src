/* @pjs preload="toufuChan.jpg"; 
 */
String imagePath = "toufuChan.jpg";
PImage img;

void setup(){
    size(500, 500);
    background(255);
    smooth();
    noStroke();
    img = loadImage(imagePath);
}

void draw() {    
    int x = (int)random(img.width - 1), y = (int)random(img.height - 1);
        
    pushMatrix();
        translate(x, y); // 描画位置を原点にすることで、回転の影響を受けないようにする．
        rotate(PI/5);
        fill(img.get(x, y));    
        ellipse(0, 0, img.width/100, img.height/25);
    popMatrix();
}
