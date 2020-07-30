/* @pjs font="TEMPSITC.TTF"; */

int n = 0;
void setup(){
    size(800, 600);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth();
}

void drawSierpinskiGasket(int p, float length){
    // finish recursive call(draw filled triangle).
    if(0 == p){
        triangle(0, 0, length, length*sqrt(3), -length, length*sqrt(3));
        return;
    }

    // make problems small.
    p--;
    length /= 2;
  
    // from top.
    pushMatrix();
        drawSierpinskiGasket(p, length);
    popMatrix();

    // from right middle.
    pushMatrix();
        translate(length, length*sqrt(3));
        drawSierpinskiGasket(p, length);
    popMatrix();
  
    // from left middle
    pushMatrix();
        translate( -length, length*sqrt(3));
        drawSierpinskiGasket(p, length);
    popMatrix();
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 10)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw(){
    background(255);
    text("n = " + n, 10, 30);
    translate(width / 2, 0);
    drawSierpinskiGasket(n, width / 3);
}
