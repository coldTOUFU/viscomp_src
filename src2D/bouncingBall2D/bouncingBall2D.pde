// 反発係数1で着地時にランダムな色に変わる1つのボール． 

void setup() {
    size(400, 400);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int d = 50, x = 0, y = 0;
float vx = 2, vy = 1;
float a = -1;

void draw() {
    background(255);
    ellipse(x, y, d, d);
    vy += a;
    x += vx; y -= vy;
    if(x < 0) { x = -x; vx = -vx; }
    if(x + d > width) { x = 2*(width - d) - x; vx = -vx; }
    if(y < 0) { y = -y; vy = -vy; }
    if(y+d > height) { y = 2*(height - d) - y; vy = -vy; fill(random(255), random(255), random(255)); }
}
