void setup(){
  size(400, 400, P3D);
  noStroke();
}

float dx = .05, dy = .05;
float x = 0, y = 0;

void draw(){
  background(255);
  translate(200, 150, -50);
  rotateX(x);
  rotateY(y);
  scale(50, 50, 50);
  coloredCube(255);
  
  if(x <= 2*PI)       { x += dx; } // rotateX.
  else if( y <= 2*PI) { y += dy; } // rotateY.
  else                { x = 0; y = 0; } // reset.
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
