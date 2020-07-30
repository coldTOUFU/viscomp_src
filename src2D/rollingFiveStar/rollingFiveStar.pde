void setup() {
    size(400, 200);
    smooth();
    noStroke();
    fill(200, 255, 200);
    ellipseMode(CORNER);
    frameRate(30);
}

int r = 40;
int diff_x = r, vx = 2;
int diff_th = 0, vth = 6;
void draw() {
    background(255);
    beginShape();
        for(int i = 0; i < 5; i++) {
            float theta = 2 * TWO_PI / 5 * i - HALF_PI;
            int x, y;
            x = int(r * cos(theta - diff_th) + diff_x);
            y = int(r * sin(theta - diff_th) + height / 2);
    
            vertex(x, y);
        }
    endShape();
    
    diff_x += vx;
    diff_th += vth;
    
    if(diff_x-r < 0) { diff_x = 2*r-diff_x; vx = -vx; vth = -vth; }
    if(diff_x+r > width) { diff_x = 2*(width - r) - diff_x; vx = -vx; vth = -vth; }
}
