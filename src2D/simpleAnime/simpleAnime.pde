void setup() {
    size(400, 20);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 20, x = 0, vx = 1;

void draw() {
    background(255);
    ellipse(x, 0, d, d);
    x += vx;
}
