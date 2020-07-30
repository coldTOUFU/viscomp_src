void setup() {
    size(400, 400);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 20, x = 0, y = 0, vx = 1, vy = 2;

void draw() {
    background(255);
    ellipse(x, y, d, d);
    x += vx; y += vy;
    if((x > width) || (y > height)) { x = y = 0; }
}
