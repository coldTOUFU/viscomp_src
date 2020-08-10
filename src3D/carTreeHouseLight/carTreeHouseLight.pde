PImage carImg, sandImg, roofImg, trunkImg, leafImg;

void setup(){
    size(600, 600, P3D);
    noStroke();
    carImg = loadImage("car.jpg");
    sandImg = loadImage("sand.jpg");
    roofImg = loadImage("roof.jpg");
    trunkImg = loadImage("trunk.jpg");
    leafImg = loadImage("leaf.jpg");
}

float z1 = 0, z2 = -20*width, z3 = 0, zCam = 0, zCar = 0, vz = -10;
boolean willDrawTree = true, willDrawCar = false;
int cameraType = 0;

void draw(){
    background(13, 18, 22);
    ambientLight(128, 128, 128);

    translate(width/2, height/2, -width/2);
    fill(150, 116, 39);

    /* ground. */
    pushMatrix();
        translate(0, 0, z1);
        beginShape(QUADS);
            texture(sandImg);
            textureMode(NORMAL);
            vertex(width, 0, 3*width, 1, 1);
            vertex(width, 0, -3*width, 1, 0);
            vertex(-width, 0, -3*width, 0, 0);
            vertex(-width, 0, 3*width, 0, 1);
        endShape(CLOSE);
    popMatrix();

    /* draw car. main object. */
    pushMatrix();
        translate(.25*width, .14*height, 0);
        rotateY(PI/2);
        drawCar(.1*width, 147, 16, 24, carImg);
    popMatrix();
    
    /* draw car. goes through main car. */
    pushMatrix();
        if(zCar < -2*width) { zCar = 2*width; willDrawCar = random(100) < 10; } // appears in 10%.
        translate(-.25*width, .14*height, zCar);
        rotateY(-PI/2);
        if(willDrawCar) { drawCar(.1*width, 147, 16, 24, carImg); }
    popMatrix();

    /* draw house. */
    pushMatrix();
        if(z1 < -2*width) { z1 = width; }
        translate(.75*width, 0, z1);
        if(z1 >= -width) {
            drawHouse(width);
        } // house appears in longer span than trees.
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
        pushMatrix();
            scale(.25, .1, .8);
            box(1);
        popMatrix();
        translate(0, .1, 0);
        fill(255);
        box(.25, .1, .8);
        translate(0, .05, 0);
        fill(188, 176, 156);
        roof(roofImg);
    popMatrix();
}

void roof(PImage img) {
    beginShape(TRIANGLES);
        texture(img);
        textureMode(NORMAL);
        vertex(0, .3, 0, .5, 0); vertex(-.25, 0, -.5, 0, 1); vertex(.25, 0, -.5, 1, 1);
        vertex(0, .3, 0, .5, 0); vertex(.25, 0, -.5, 0, 1); vertex(.25, 0, .5, 1, 1);
        vertex(0, .3, 0, .5, 0); vertex(.25, 0, .5, 0, 1); vertex(-.25, 0, .5, 1, 1);
        vertex(0, .3, 0, .5, 0); vertex(-.25, 0, .5, 0, 1); vertex(-.25, 0, -.5, 1, 1);
        vertex(-.25, 0, -.5); vertex(.25, 0, .5); vertex(.25, 0, -.5);
        vertex(-.25, 0, -.5); vertex(-.25, 0, .5); vertex(.25, 0, .5);
    endShape();
    pushMatrix();
        translate(0, .16, 0);
        rotateZ(PI/4);
        rotateY(PI/2);
        scale(.5, .2, .2);
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
      endShape();
    popMatrix();
}

////////////////////////////////////////////////////////////////////////////


///////////////////////////////////tree/////////////////////////////////////

void leafTextured(PImage img) {
    beginShape(TRIANGLES);
        texture(img);
        textureMode(NORMAL);
        vertex(0, .5, 0, .5, 0); vertex(-.5, 0, -.5, 0, 1); vertex(.5, 0, -.5, 1, 1);
        vertex(0, .5, 0, .5, 0); vertex(.5, 0, -.5, 0, 1); vertex(.5, 0, .5, 1, 1);
        vertex(0, .5, 0, .5, 0); vertex(.5, 0, .5, 0, 1); vertex(-.5, 0, .5, 1, 1);
        vertex(0, .5, 0, .5, 0); vertex(-.5, 0, .5, 0, 1); vertex(-.5, 0, -.5, 1, 1);
        vertex(-.5, 0, -.5); vertex(.5, 0, .5); vertex(.5, 0, -.5);
        vertex(-.5, 0, -.5); vertex(-.5, 0, .5); vertex(.5, 0, .5);
    endShape();
}

void leavesTextured(){
  pushMatrix();
    translate(0, .5, 0);
    scale(.6, .6, .6);
    leafTextured(leafImg);
  popMatrix();
  
  pushMatrix();
    translate(0, .25, 0);
    scale(.8, .8, .8);
    leafTextured(leafImg);
  popMatrix();
  
  leafTextured(leafImg);
}

void trunkTextured(PImage img) {
    pushMatrix();
        scale(.2, .5, .2);
        translate(-.5, 0, -.5);
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
      endShape();
    popMatrix();
}

void drawTree(float s){
  noStroke();
  pushMatrix();
    scale(s, s, s);
    trunkTextured(trunkImg);
    pushMatrix();
      translate(0, .4, 0);
      leavesTextured();
    popMatrix();

  popMatrix();
}

////////////////////////////////////////////////////////////////////////////

///////////////////////////////////car//////////////////////////////////////


// Mitsubishi A-type.
void drawCar(float size, int r, int g, int b, PImage img) {
    float delta = .01*size;

    fill(0);
    // car body above.
    pushMatrix();
        translate(4./3.*size, .5*size, 0);
        box(4./3.*size, size, 1.5*size);
    popMatrix();
    
    // car roof.
    pushMatrix();
        fill(0);
        translate(2./3.*size, size, 0);
        box(8./3.*size, .1*size, 1.5*size);

        // roof columns.
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
        pushMatrix();
            scale(4.*size, size, 1.5*size);
            boxTextured(img);
        popMatrix();

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
        pointLight(255, 255, 0, 0, size, 0);
        cylinder(size/3, size/7., size/7.);
        translate(0, 0, -1.2*size);
        pointLight(255, 255, 0, 0, size, 0);
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

////////////////////////////////images from//////////////////////////////////
// car:   https://www.99kobo.jp/rebirth_project/fiat-panda/535/
// sand:  https://www.pakutaso.com/20190902273post-23455.html
// trunk: https://pro-foto.jp/free/product_info.php/products_id/236
// leaf:  https://www.beiz.jp/%E7%B4%A0%E6%9D%90/%E6%9C%A8/00006.html
// roof:  https://pixabay.com/ja/photos/%E8%8C%85%E8%91%BA%E3%81%8D%E5%B1%8B%E6%A0%B9-%E3%82%A2%E3%82%A4%E3%83%AB%E3%83%A9%E3%83%B3%E3%83%89-981891/
