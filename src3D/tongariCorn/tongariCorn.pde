void setup() {
    size(600, 600, P3D);
    noStroke();
}

void draw() {
    background(255);
    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    pushMatrix();
    scale(width/2, width/2, width/2);
    drawTongariCorn();
    popMatrix();
}

void drawTongariCorn() {
    fill(0);
    PImage img = loadImage("tongariCorn.jpg");
    texturedCylinder(2, 1, 0, img);
}

// only side is textured. circles are filled with a color of the center of img.
void texturedCylinder(float l, float uR, float dR, PImage img) {
    float x, y, z, u;
    fill(img.get(img.width/2, img.height/2));
  
    pushMatrix();
        // circle above.
        beginShape(TRIANGLE_FAN);
            y = -l / 2;
            vertex(0, y, 0);
            for (int deg = 0; deg <= 360; deg += 10) {
                x = cos(radians(deg)) * uR;
                z = sin(radians(deg)) * uR;
                vertex(x, y, z);
            }  
        endShape();              
      
        // circle below.
        beginShape(TRIANGLE_FAN);
            y = l / 2;
          
            vertex(0, y, 0);
            for (int deg = 0; deg <= 360; deg = deg + 10) {
                x = cos(radians(deg)) * dR;
                z = sin(radians(deg)) * dR;
                vertex(x, y, z);
            }
        endShape();
      
        // side.
        beginShape(TRIANGLE_STRIP);
            texture(img);
            textureMode(NORMAL);
          
            for (int deg =0; deg <= 360; deg = deg + 5) {
                u = deg / 360.;
            
                x = cos(radians(deg)) * uR;
                y = -l / 2;
                z = sin(radians(deg)) * uR;
                vertex(x, y, z, u, 1);
                x = cos(radians(deg)) * dR;
                y = l / 2;
                z = sin(radians(deg)) * dR;
                vertex(x, y, z, u, 0);
            }
        endShape();
    popMatrix();
}
