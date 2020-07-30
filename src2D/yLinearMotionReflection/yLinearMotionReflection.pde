void setup() {
    size(400, 200);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 20, y = 0, vy = 2;

void draw() {
    background(255);
    ellipse(width/2, y, d, d);
    y += vy;
    if(y < 0) { y = -y; vy = -vy; }
    if(y+d > height) { y = 2*(height - d) - y; vy = -vy; }
}
