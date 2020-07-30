void setup() {
    size(640, 480);
    background(255);
    smooth();
    noStroke();
    fill(255, 0, 0);
}

void draw() {
    if(mousePressed) {
        if(mouseButton == LEFT) { ellipse(mouseX, mouseY, 5, 5); }
        else if(mouseButton == RIGHT) { background(255); }
    }
}
