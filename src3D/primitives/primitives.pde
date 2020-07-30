void setup(){
  size(400, 300, P3D);
  noStroke();
  background(255);
}

void draw(){
  lights();
  fill(255, 255, 0);
  pushMatrix();
    translate(120, 150, 0);
    rotateX(-PI / 8.);
    rotateY(-PI / 4.);
    box(100);
  popMatrix();

  fill(255, 0, 255);
  pushMatrix();
    translate(280, 150, 0);
    sphere(70);
  popMatrix();
}
