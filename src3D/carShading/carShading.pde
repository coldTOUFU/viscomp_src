PImage glassImg, dirtyBodyImg;

void setup(){
    size(600, 600, P3D);
    noStroke();
    glassImg = loadImage("glass.jpg");
    dirtyBodyImg = loadImage("dirtyBody.jpg");
}

void draw(){
    background(255);
    lightSpecular(255, 255, 255);
    ambientLight(128, 128, 128);
    directionalLight(100, 100, 100, -.5, .5, -1);

    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    drawCar(100);
}

// Mitsubishi A-type.
void drawCar(float size) {
    float delta = .01*size;

    // car body above.
    ambient(200, 230, 255);
    specular(200, 230, 255);
    emissive(0, 0, 0);
    shininess(255);
    pushMatrix();
        translate(4./3.*size, .5*size, 0);
        scale(4./3.*size, size, 1.5*size);
        boxTextured(glassImg);
    popMatrix();
    
    // car ceil.
    pushMatrix();
        ambient(0, 0, 0);
        specular(255, 255, 255);
        emissive(0, 0, 0);
        shininess(200);
        translate(2./3.*size, size, 0);
        box(8./3.*size, .1*size, 1.5*size);

        // ceil columns.
        translate(-4./3.*size, -.5*size, .75*size);
        cylinder(size, .05*size, .05*size);
        translate(0, 0, -1.5*size);
        cylinder(size, .05*size, .05*size);
    popMatrix();
    
    // car body below.
    pushMatrix();
        // body.
        ambient(147, 16, 24);
        specular(255, 255, 255);
        emissive(0, 0, 0);
        shininess(200);
        translate(0, -.5*size, 0);
        pushMatrix();
        scale(4.*size, size, 1.5*size);
        boxTextured(dirtyBodyImg);
        popMatrix();

        // tire forward.
        pushMatrix();
            translate(-2.*size, -.5*size, 0);
            rotateY(PI/2);
            ambient(0, 0, 0);
            specular(0, 0, 0);
            emissive(0, 0, 0);
            shininess(0);
            tire(.4*size, 1.5*size); //outer.
            ambient(147, 16, 24);
            specular(255, 255, 255);
            emissive(0, 0, 0);
            shininess(200);
            tire(.25*size, 1.55*size); // inner.
        popMatrix();
        
        // tire backward.
        pushMatrix();
            translate((2.-0.4)*size, -.5*size, 0);
            rotateY(PI/2);
            ambient(0, 0, 0);
            specular(0, 0, 0);
            emissive(0, 0, 0);
            shininess(0);
            tire(.4*size, 1.5*size); // outer.
            ambient(147, 16, 24);
            specular(255, 255, 255);
            emissive(0, 0, 0);
            shininess(200);
            tire(.25*size, 1.55*size); // inner.
        popMatrix();
        
        // face.
        ambient(218, 179, 0);
        specular(255, 255, 255);
        emissive(0, 0, 0);
        shininess(20);
        translate(-2*size, 0, 0);
        box(.2*size, size+delta, 1.5*size+delta);
        ambient(0, 0, 0);
        specular(0, 0, 0);
        emissive(0, 0, 0);
        shininess(0);
        box(.2*size+delta, size-delta, 1.5*size-delta);

        // headlights.
        ambient(0, 0, 0);
        specular(255, 255, 255);
        emissive(255, 255, 150);
        shininess(255);
        rotateZ(PI/2);
        translate(.1*size, 0, .6*size);
        cylinder(size/3, size/7., size/7.);
        translate(0, 0, -1.2*size);
        cylinder(size/3, size/7., size/7.);
    popMatrix();
}

void tire(float r, float w) {
    // left tire.
    pushMatrix();
        translate(-w/2., 0, 0);
        rotateZ(PI/2);
        cylinder(r/4., r, r);
    popMatrix();

    // right tire.
    pushMatrix();
        translate(w/2., 0, 0);
        rotateZ(PI/2);
        cylinder(r/4., r, r);
    popMatrix();
}

void cylinder(float l, float uR, float dR) {
    float x, y, z;

    pushMatrix();
        // circle above.
        beginShape(TRIANGLE_FAN);
            y = -l / 2;
            vertex(0, y, 0);
            for(int deg = 0; deg <= 360; deg += 10){
                x = cos(radians(deg)) * uR;
                z = sin(radians(deg)) * uR;
                vertex(x, y, z);
            }  
        endShape();              

        // circle below.
        beginShape(TRIANGLE_FAN);
            y = l / 2;
            vertex(0, y, 0);
            for(int deg = 0; deg <= 360; deg = deg + 10){
                x = cos(radians(deg)) * dR;
                z = sin(radians(deg)) * dR;
                vertex(x, y, z);
            }
        endShape();

        // side.
        beginShape(TRIANGLE_STRIP);
        for(int deg =0; deg <= 360; deg = deg + 5){
            x = cos(radians(deg)) * uR;
            y = -l / 2;
            z = sin(radians(deg)) * uR;
            vertex(x, y, z);
            x = cos(radians(deg)) * dR;
            y = l / 2;
            z = sin(radians(deg)) * dR;
            vertex(x, y, z);
        }
        endShape();
    popMatrix();
}

void boxTextured(PImage img) {
    pushMatrix();
        translate(-.5, -.5, -.5);
        beginShape(QUADS);
            texture(img);
            textureMode(NORMAL);
            vertex(0, 1, 0, 0, 0); vertex(0, 0, 0, 0, 1);
              vertex(1, 0, 0, 1, 1); vertex(1, 1, 0, 1, 0);
            vertex(1, 1, 0, 0, 0); vertex(1, 0, 0, 0, 1);
              vertex(1, 0, 1, 1, 1); vertex(1, 1, 1, 1, 0);
            vertex(1, 1, 1, 0, 0); vertex(1, 0, 1, 0, 1);
              vertex(0, 0, 1, 1, 1); vertex(0, 1, 1, 1, 0);
            vertex(0, 1, 1, 0, 0); vertex(0, 0, 1, 0, 1);
              vertex(0, 0, 0, 1, 1); vertex(0, 1, 0, 1, 0);
            vertex(0, 1, 1, 0, 0); vertex(0, 1, 0, 0, 1);
              vertex(1, 1, 0, 1, 1); vertex(1, 1, 1, 1, 0);
            vertex(0, 0, 0, 0, 0); vertex(0, 0, 1, 0, 1);
              vertex(1, 0, 1, 1, 1); vertex(1, 0, 0, 1, 0);
      endShape(CLOSE);
    popMatrix();
}

// glass.jpg: https://stock.adobe.com/jp/Category/glass-textures/484
// dirtyBody.jpg: https://www.kasaikobo.jp/referencebook/car/nissan-fuga-white-body/
