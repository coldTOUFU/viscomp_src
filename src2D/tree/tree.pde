/* @pjs font="TEMPSITC.TTF"; */

int n = 0;
void setup(){
    size(800, 600);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    stroke(0);
    smooth();
}

void drawTree(int p, float length, float lRate, float angle){
    // draw line in this problem.
    line(0, 0, 0, -length);
    
    // finish recursive call.
    if(0 == p){ return; } 

    // for smaller problems.
    float startY =  -length;

    // make problems small.
    p--;
    length *= lRate;
  
    // from right top.
    pushMatrix();
        translate(0, startY);
        rotate(angle);
        drawTree(p, length, lRate, angle);
    popMatrix();
    
    // from left top.
    pushMatrix();
        translate(0, startY);
        rotate(-angle);
        drawTree(p, length, lRate, angle);
    popMatrix();
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 10)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw(){
    background(255);
    text("n = " + n, 10, 30);
    translate(width / 2, height);
    drawTree(n, height / 3, 0.6, PI/6);
}
