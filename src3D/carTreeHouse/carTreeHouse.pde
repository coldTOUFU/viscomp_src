void setup(){
    size(600, 600, P3D);
    noStroke();
}

float z1 = 0, z2 = -20*width, z3 = 0, zCam = 0, zCar = 0, vz = -10;
boolean willDrawTree = true, willDrawCar = false;
int cameraType = 0;

void draw(){
    background(138, 189, 222);
    translate(width/2, height/2, -width/2);
    fill(150, 116, 39);
    
    /* ground. */
    box(2*width, 1, 4*width);

    /* draw car. main object. */
    pushMatrix();
        translate(.25*width, .14*height, 0);
        rotateY(PI/2);
        drawCar(.1*width, 147, 16, 24);
    popMatrix();
    
    /* draw car. goes through main car. */
    pushMatrix();
        if(zCar < -2*width) { zCar = 2*width; willDrawCar = random(100) < 5; } // appears in 5%.
        translate(-.25*width, .14*height, zCar);
        rotateY(-PI/2);
        if(willDrawCar) { drawCar(.1*width, 0, 0, 100); }
    popMatrix();
    
    /* draw house. */
    pushMatrix();
        if(z1 < -2*width) { z1 = width; }
        translate(.75*width, 0, z1);
        if(z1 >= -width) { drawHouse(width); } // house appears in longer span than trees.
    popMatrix();
    
    /* draw tree. */
    pushMatrix();
        if(z3 < -width) { z3 = width; }
        translate(-.75*width, 0, z3);
        drawTree(.5*width);
    popMatrix();
    
    /* draw tree or house. tree will be drawn by 70%. */
    pushMatrix();
        if(z2 < -width) { z2 = width; willDrawTree = random(10) >= 3; }
        translate(-.75*width, 0, z2);
        if(willDrawTree) {
            drawTree(.5*width);
        } else {
            drawHouse(width);
        }
    popMatrix();
    
    // camera angles.
    if(zCam < -2*width) { zCam = width; cameraType = (int)random(3); }
    switch(cameraType) {
    case 0:
        camera(.75*width, .75*height, .75*width, .75*width, .5*height, 0, 0, -1, 0);
        break;
    case 1:
        camera(1.5*width, height, -.5*width, 0, 0, 0, 0, -1, 0);
        break;
    case 2:
        camera(1.5*width, height, .5*width+zCam, 0, 0, 0, 0, -1, 0);
        break;
    }
    
    z1 += vz; z2 += vz; z3 += vz; zCam += vz; zCar += 2*vz; // car will goes through 2 times faster relatively.
}

///////////////////////////////////house////////////////////////////////////

void drawHouse(float s) {
    pushMatrix();
        scale(s, s, s);
        translate(0, .05, 0);
        fill(134, 73, 68);
        box(.25, .1, .8);
        translate(0, .1, 0);
        fill(255);
        box(.25, .1, .8);
        translate(0, .05, 0);
        fill(188, 176, 156);
        ceil();
    popMatrix();
}

void ceil(){
    beginShape(TRIANGLES);
        vertex(0, .3, 0); vertex(-.25, 0, -.5); vertex(.25, 0, -.5);
        vertex(0, .3, 0); vertex(.25, 0, -.5); vertex(.25, 0, .5);
        vertex(0, .3, 0); vertex(.25, 0, .5); vertex(-.25, 0, .5);
        vertex(0, .3, 0); vertex(-.25, 0, .5); vertex(-.25, 0, -.5);
        vertex(-.25, 0, -.5); vertex(.25, 0, .5); vertex(.25, 0, -.5);
        vertex(-.25, 0, -.5); vertex(-.25, 0, .5); vertex(.25, 0, .5);
    endShape();
    pushMatrix();
        translate(0, .16, 0);
        rotateZ(PI/4);
        rotateY(PI/2);
        box(.5, .2, .2);
    popMatrix();
}

////////////////////////////////////////////////////////////////////////////


///////////////////////////////////tree/////////////////////////////////////

void leaf(int r, int g, int b){
  fill(r, g, b);
  beginShape(TRIANGLES);
    vertex(0, .5, 0); vertex(-.5, 0, -.5); vertex(.5, 0, -.5);
    vertex(0, .5, 0); vertex(.5, 0, -.5); vertex(.5, 0, .5);
    vertex(0, .5, 0); vertex(.5, 0, .5); vertex(-.5, 0, .5);
    vertex(0, .5, 0); vertex(-.5, 0, .5); vertex(-.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(.5, 0, .5); vertex(.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(-.5, 0, .5); vertex(.5, 0, .5);
  endShape();
}

void leaves(){
  pushMatrix();
    translate(0, .5, 0);
    scale(.6, .6, .6);
    leaf(0, 224, 0);
  popMatrix();
  
  pushMatrix();
    translate(0, .25, 0);
    scale(.8, .8, .8);
    leaf(0, 192, 0);
  popMatrix();
  
  leaf(0, 128, 0);
}

void trunk(){
  fill(128, 64, 0);
  pushMatrix();
    scale(.2, .4, .2);
    translate(0, .5, 0);
    box(1);
  popMatrix();
}

void drawTree(float s){
  noStroke();
  pushMatrix();
    scale(s, s, s);
    trunk();
    pushMatrix();
      translate(0, .4, 0);
      leaves();
    popMatrix();

  popMatrix();
}

////////////////////////////////////////////////////////////////////////////

///////////////////////////////////car//////////////////////////////////////


// Mitsubishi A-type.
void drawCar(float size, int r, int g, int b) {
    float delta = .01*size;

    fill(0);
    // car body above.
    pushMatrix();
        translate(4./3.*size, .5*size, 0);
        box(4./3.*size, size, 1.5*size);
    popMatrix();
    
    // car ceil.
    pushMatrix();
        fill(0);
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
        fill(r, g, b);
        translate(0, -.5*size, 0);
        box(4.*size, size, 1.5*size);

        // tire forward.
        pushMatrix();
            fill(50);
            translate(-2.*size, -.5*size, 0);
            rotateY(PI/2);
            tire(.4*size, 1.5*size); //outer.
            fill(r, g, b);
            tire(.25*size, 1.55*size); // inner.
        popMatrix();
        
        // tire backward.
        pushMatrix();
            fill(50);
            translate((2.-0.4)*size, -.5*size, 0);
            rotateY(PI/2);
            tire(.4*size, 1.5*size); // outer.
            fill(r, g, b);
            tire(.25*size, 1.55*size); // inner.
        popMatrix();
        
        // face.
        translate(-2*size, 0, 0);
        fill(218, 179, 0);
        box(.2*size, size+delta, 1.5*size+delta);
        fill(0);
        box(.2*size+delta, size-delta, 1.5*size-delta);

        // headlights.
        fill(200);
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

////////////////////////////////////////////////////////////////////////////
