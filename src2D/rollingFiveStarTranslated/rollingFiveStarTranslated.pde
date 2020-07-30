void setup() {
  size(600, 400);
  background(255);
  smooth();
  noStroke();
  fill(100);
}

void star(){
  beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    vertex(.5 * cos(theta), .5 * sin(theta));
  }
  endShape();
}

int theta = 0, x = 0;

void draw() {
  background(255);
  pushMatrix();
    translate(x++, height/2);
    scale(height / 5, width / 5);
    rotate(theta++);
    star();
  popMatrix();
}
