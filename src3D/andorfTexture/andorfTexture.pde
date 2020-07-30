PImage img;
void setup(){
  size(400, 300, P3D);
  img = loadImage("andorf.png");
  noStroke();
}

void texturedCube(){
  pushMatrix();
    translate(-.5, -.5, -.5);
    beginShape(QUADS);
      texture(img);
      textureMode(NORMAL);
      vertex(0, 1, 0, 0, 0); vertex(0, 0, 0, 0, 1);
        vertex(1, 0, 0, 1, 1); vertex(1, 1, 0, 1, 0);
      vertex(1, 1, 0, 0, 0); vertex(1, 0, 0, 0, 1);
        vertex(1, 0, 1, 1, 1); vertex(1, 1, 1, 1, 0);
      vertex(1, 1, 1, 0, 0); vertex(1, 0, 1, 0, 1);
        vertex(0, 0, 1, 1, 1); vertex(0, 1, 1, 1, 0);
      vertex(0, 1, 1, 0, 0); vertex(0, 0, 1, 0, 1);
        vertex(0, 0, 0, 1, 1); vertex(0, 1, 0, 1, 0);
      vertex(0, 1, 1, 0, 0); vertex(0, 1, 0, 0, 1);
        vertex(1, 1, 0, 1, 1); vertex(1, 1, 1, 1, 0);
      vertex(0, 0, 0, 0, 0); vertex(0, 0, 1, 0, 1);
        vertex(1, 0, 1, 1, 1); vertex(1, 0, 0, 1, 0);
    endShape();
  popMatrix();
}

void draw(){
  background(255);
  lights();
  translate(200, 150, -150);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  scale(200, 200, 200);
  texturedCube();
}
