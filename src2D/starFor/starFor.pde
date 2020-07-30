background(255);
smooth();
noStroke();
fill(152, 251, 152);

int r = height / 2;
beginShape();
    for(int i = 0; i < 5; i++) {
        float theta = 2 * TWO_PI / 5 * i - HALF_PI;
        int x, y;
        x = int(r * cos(theta) + width / 2);
        y = int(r * sin(theta) + height / 2);

        vertex(x, y);
    }
endShape();
