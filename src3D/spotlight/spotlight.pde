void setup(){
  size(400, 300, P3D);
  noStroke();
  fill(192);
}

void draw(){
  background(32);
  float theta = map(mouseY, 0, height, -PI / 2, PI / 2);
  float phi = map(mouseX, 0, width, -PI / 2, PI / 2);
  
  float x = 500 * sin(phi);
  float y = 500 * sin(theta);
  float z = 500 * cos(phi) * cos(theta);
  
  pushMatrix();
    translate(width / 2, height / 2, 0);
    spotLight(255, 255, 255, x, y, z, -x, -y, -z, PI / 2, 500);
    sphere(80);
  popMatrix();
}
