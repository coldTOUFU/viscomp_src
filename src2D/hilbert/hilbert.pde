/* @pjs font="TEMPSITC.TTF"; */

int n = 0;
void setup(){
    size(800, 800);
    textFont(createFont("Tempus Sans ITC", 24));
    fill(0);
    smooth();
}

void drawHilbert(int level, float w, float h){
    /* finish the recursive call */
    if(level == 0){
        line(.25*w, .25*h, .25*w, .75*h);
        line(.25*w, .75*h, .75*w, .75*h);
        line(.75*w, .75*h, .75*w, .25*h);
        return;
    }
  
    /* make problems smaller. */
    level--;
    w /= 2; h /= 2;
    float link_rate = 1. / (float)Math.pow(2, level); // link line gets shorter along with level.
  
    /* A */
    pushMatrix();
        translate(0, 0);
        rotate(-PI/2);
        scale(-1, 1);
        line((1-0.25*link_rate)*w, .25*link_rate*h, (1+.25*link_rate)*w, .25*link_rate*h); // link A-B.
        drawHilbert(level, w, h);
    popMatrix();
  
    /* B */
    pushMatrix();
        translate(0, h);
        rotate(0);
        scale(1, 1);
        line((1-0.25*link_rate)*w, .25*link_rate*h, (1+.25*link_rate)*w, .25*link_rate*h); // link B-C.
        drawHilbert(level, w, h);
    popMatrix();
    
    /* C */
    pushMatrix();
        translate(w, h);
        rotate(0);
        scale(1, 1);
        line((1-.25*link_rate)*w, .25*link_rate*h, (1-.25*link_rate)*w, -.25*link_rate*h); // link C-D.
        drawHilbert(level, w, h);
    popMatrix();
    
    /* D */
    pushMatrix();
        translate(2*w, h);
        rotate(-PI/2);
        scale(1, -1);
        drawHilbert(level, w, h);
    popMatrix();
}

void mousePressed(){
    if((mouseButton == LEFT) && (n < 9)) n++;
    else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw(){
    background(255);
    text("n = " + n, 10, 30);
    
    pushMatrix();
        translate(0, float(height));
        scale(1, -1);
        translate(.05*width, .05*height); // make space for the text "n = [max_level]"
        drawHilbert(n, .9*width, .9*height); // w and h is 90% of actual screen's, to make space for the text.
    popMatrix();
}
