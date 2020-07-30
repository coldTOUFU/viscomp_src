void setup() {
    size(400, 400);
    smooth();
    noStroke();
    fill(#ffff00);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 100;
int x = 0, vx = 2;
float rad = 0, vrad = 0.05;
float rad_max = PI / 4, rad_min = 0;

void draw() {
    background(255);
    arc(x, height/2 - d, d, d, rad, TWO_PI - rad);
    x += vx;
    if(x > width) { x = -d; }
    
    if(rad > rad_max || rad < rad_min) { vrad = -vrad; }
    rad += vrad;
}
