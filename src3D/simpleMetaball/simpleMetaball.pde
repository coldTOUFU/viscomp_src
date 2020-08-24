/* simple metaball: use sphere and limit area to calculate to only x and y(so object is flat). */

void setup(){
    size(400, 300, P3D);
    noStroke();
    background(255);
}

int ballSize = 5;
float dCenter= 100;
float decay = .0000001;

float r1x = 0, r1y = 0;
float r2x = width*2/3, r2y = height*2/3;

float threshold = 10; // sikii-chi.

void draw(){
    background(255);
    fill(150);
    
    pushMatrix();
        translate(width/2, height/2, -width/2);
        rotateX(map(mouseY, 0, height, PI, -PI));
        rotateY(map(mouseX, 0, width, -PI, PI));
        simpleMetaBall();
    popMatrix();
}

void simpleMetaBall() {
    for(int i=-width/2; i < width/2; i += ballSize) {
        for(int j=-height/2; j < height/2; j += ballSize) {
            float r1 = (i - r1x)*(i - r1x) + (j - r1y)*(j - r1y);
            float d1 = dCenter * exp(-decay * r1 * r1);
            
            float r2 = (i - r2x)*(i - r2x) + (j - r2y)*(j - r2y);
            float d2 = dCenter * exp(-decay * r2 * r2);
            if(d1 + d2 >= threshold) { //<>//
                pushMatrix();
                    translate(i, j, 0);
                    sphere(ballSize);
                popMatrix();
            }
        }
    }
}
