void setup() {
  size(360, 180);
  background(255);
  smooth();
  noStroke();
  fill(#00008B);
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
  rect(0, 0, width, height/3);
  rect(0, height * 2/3, width, height/3);

  pushMatrix();
    translate(width/3, height/3 + height/12);
    scale(width/18, width/18);
    star();
  popMatrix();

  pushMatrix();
    translate(width*2/3, height/3 + height/12);
    scale(width/18, width/18);
    star();
  popMatrix();
    
  pushMatrix();
    translate(width/3, height*2/3 - height/12);
    scale(width/18, width/18);
    star();
  popMatrix();

  pushMatrix();
    translate(width*2/3, height*2/3 - height/12);
    scale(width/18, width/18);
    star();
  popMatrix();

  pushMatrix();
    translate(width/2, height/2);
    scale(width/18, width/18);
    star();
  popMatrix();
}
