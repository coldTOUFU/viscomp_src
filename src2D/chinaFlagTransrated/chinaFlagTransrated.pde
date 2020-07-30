void setup() {
  size(600, 400);
  background(#DE2910);
  smooth();
  noStroke();
  fill(#FFDE00);
}

void star(){
  beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    vertex(.5 * cos(theta), .5 * sin(theta));
  }
  endShape();
}

void draw() {
  pushMatrix();
    translate(width/6, height/4);
    scale(height * 3/10, height * 3/10);
    star();
  popMatrix();
  
  pushMatrix();
    translate(width/3, height/10);
    scale(height/10, height/10);
    rotate(PI - atan2(-5, 3));
    star();
  popMatrix();

  pushMatrix();
    translate(width * 2/5, height/5);
    scale(height/10, height/10);
    rotate(PI - atan2(-7, 1));
    star();
  popMatrix();
  
  pushMatrix();
    translate(width * 2/5, height * 7/20);
    scale(height/10, height/10);
    rotate(0);
    star();
  popMatrix();
  
  pushMatrix();
    translate(width/3, height * 9/20);
    scale(height/10, height/10);
    rotate(PI - atan2(-5, 3));
    star();
  popMatrix();
}
