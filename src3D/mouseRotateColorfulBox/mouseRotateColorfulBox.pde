void setup(){
  size(400, 300, P3D);
  noStroke();
}

void draw(){
  background(255);
  translate(200, 150, -50);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  scale(50, 50, 50);
  coloredCube(255);
}
void coloredCube(float alpha){
  pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
    fill(255, 0, 0, alpha); // Red
    vertex(1, -1, -1); vertex(1, -1, 1); vertex(1, 1, 1); vertex(1, 1, -1);
    fill(0, 255, 0, alpha); // Green
    vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
    fill(0, 0, 255, alpha); // Blue
    vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1);
    fill(255, 255, 0, alpha); // Yellow
    vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1);
    fill(255, 0, 255, alpha); // Magenta
    vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
    fill(0, 255, 255, alpha); // Cyan
    vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1);
    endShape();
  popMatrix();
}
