size(360, 180);
background(255); 
smooth();
noStroke();

fill(#00008B);
int r = width / 36;
for(int k = 0; k < 2; k++) {
    beginShape();
        for(int i = 0; i < 5; i++) {
            float theta = 2 * TWO_PI / 5 * i - HALF_PI;
            int x, y;
            x = int(r * cos(theta) + width * (k+1) / 3);
            y = int(r * sin(theta) + height / 3 + width / 72 * 3);
        
            vertex(x, y);
        }
    endShape();
    beginShape();
        for(int i = 0; i < 5; i++) {
            float theta = 2 * TWO_PI / 5 * i - HALF_PI;
            int x, y;
            x = int(r * cos(theta) + width * (k+1) / 3);
            y = int(r * sin(theta) + height * 2 / 3 - width / 72 * 3);
        
            vertex(x, y);
        }
    endShape();
}
beginShape();
    for(int i = 0; i < 5; i++) {
        float theta = 2 * TWO_PI / 5 * i - HALF_PI;
        int x, y;
        x = int(r * cos(theta) + width / 2);
        y = int(r * sin(theta) + height / 2);
        
        vertex(x, y);
    }
endShape();

rect(0, 0, width, height / 3);
rect(0, height * 2 / 3, width, height / 3);
