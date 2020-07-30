void setup() {
    size(640, 480);
    noFill();
    background(255);
}

int x1 = -1, y1 = -1, x2 = -1, y2 = -1, x3 = -1, y3 = -1, x4 = -1, y4 = -1;

void mouseClicked() {
    if(x1 < 0)      { ellipse(mouseX, mouseY, 5, 5); x1 = mouseX; y1 = mouseY; }
    else if(x2 < 0) { ellipse(mouseX, mouseY, 5, 5); x2 = mouseX; y2 = mouseY; }
    else if(x3 < 0) { ellipse(mouseX, mouseY, 5, 5); x3 = mouseX; y3 = mouseY; }
    else if(x4 < 0) { ellipse(mouseX, mouseY, 5, 5); x4 = mouseX; y4 = mouseY; }
}
void draw() {
    if(x4 > 0) {
        bezier(x1, y1, x2, y2, x3, y3, x4, y4);
        x1 = x4; y1 = y4;
        x2 = x4 + (x4 - x3); y2 = y4 + (y4 - y3);
        ellipse(x2, y2, 5, 5); 

        x3 = -1; x4 = -1;
    }
}
