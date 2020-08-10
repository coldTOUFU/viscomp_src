void setup() {
    size(600, 600, P3D);
}

void draw() {
    background(255);
    noStroke();
    lightSpecular(255, 255, 255);
    ambientLight(128, 128, 128);
    directionalLight(100, 100, 100, -.5, .5, -1);
    pushMatrix();
        translate(width/2, height/3, 0);
        drawMetalBall();
    popMatrix();
    pushMatrix();
        translate(width/4, height*2/3, 0);
        drawPlasticBall();
    popMatrix();
    pushMatrix();
        translate(width*3/4, height*2/3, 0);
        drawLightBulb();
    popMatrix();
}

void drawMetalBall() {
    ambient(180, 180, 180);
    specular(255, 255, 255);
    emissive(0, 0, 0);
    shininess(20);
    sphere(100);
}

void drawPlasticBall() {
    ambient(0, 0, 255);
    specular(255, 255, 255);
    emissive(0, 0, 0);
    shininess(200);
    sphere(100);
}

void drawLightBulb() {
    ambient(0, 0, 0);
    specular(255, 255, 255);
    emissive(255, 255, 150);
    shininess(255);
    sphere(100);
}
