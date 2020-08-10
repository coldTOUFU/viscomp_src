void setup(){
  size(400, 300, P3D);
  noStroke();
}

void drawFloor(){
  fill(128);
  int s = 5;
  for(int z = -100; z < 100; z += s){
    for(int x = -100; x < 100; x += s){
      beginShape(QUADS);
      vertex(x, 0, z); vertex(x, 0, z + s); vertex(x + s, 0, z + s); vertex(x + s, 0, z);
      endShape();
    }
  }
}

float xAngle = 0, zAngle = 0;
float dAngle = .1;
void draw(){
  background(192);
  lights();
  pushMatrix();
    translate(width/2, height*2/3, -50);
    rotateX(radians(160));
    rotateY(radians(-30));
    // lights
    pushMatrix();
      translate(width/8, 0, -width/8);
      spotLight(255, 0, 0, 50*cos(xAngle), 50, -50*sin(zAngle), -1, -1, 1, PI / 2, 50);
      spotLight(0, 255, 0, 50*cos(xAngle), 50, -50*sin(-zAngle), -1, -1, 1, PI / 2, 50);
      spotLight(0, 0, 255, 50*cos(PI+xAngle), 50, -50*sin(PI+zAngle), -1, -1, 1, PI / 2, 50);
    popMatrix();
    drawFloor();

  popMatrix();
  
  xAngle += dAngle; zAngle += dAngle;
}
