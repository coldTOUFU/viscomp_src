/* @pjs font="TEMPSITC.TTF"; */

int n = 0;
void setup(){
  size(800, 300);
  textFont(createFont("Tempus Sans ITC", 24));
  fill(0);
  smooth();
}

void drawKoch(int level, float length){ // level: # of recursive, length
  if(0 == level){ // finish the recursive call
    line(0, 0, length, 0); // draw line at current coordinate systems
    return;
  }

  drawKoch(--level, length /= 3); // draw P0-P1

  pushMatrix(); // draw P1-P2
  translate(length, 0); // translate (length, 0)
  rotate(-PI / 3); // rotate (-PI / 3)
  drawKoch(level, length);
  popMatrix();

  pushMatrix(); // draw P2-P3
  translate(1.5 * length, length * sin(-PI / 3)); // translate (3 * length / 2, - \sqrt{3} * length / 2)
  rotate(PI / 3); // rotate (PI / 3)
  drawKoch(level, length);
  popMatrix();

  pushMatrix(); // draw P3-P4
  translate(2 * length, 0); // translate (2 * length, 0)
  drawKoch(level, length);
  popMatrix();
}

void mousePressed(){
  if((mouseButton == LEFT) && (n < 8)) n++;
  else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw(){
  background(255);
  text("n = " + n, 10, 30);
  translate(0, height - 10);
  drawKoch(n, float(width));
}
