void setup(){
    size(600, 600, P3D);
    background(255);
    fill(100);
}

void draw(){
    background(255);
    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    human();
}

void human() {
    int bodyW = 150, bodyH = 250, bodyD = 100;
  
    // body.
    box(bodyW, bodyH, bodyD);

    // head.
    pushMatrix();
        translate(0, -bodyH*7/10, 0);
        box(bodyW*4/5, bodyH*3/10, bodyD*4/5);
    popMatrix();

    // left leg.
    pushMatrix();
        translate(-bodyW*3/8, bodyH*3/4, 0);
        limb(bodyW/4, bodyH*4/5, bodyW/4);
    popMatrix();

    // right leg.
    pushMatrix();
        translate(bodyW*3/8, bodyH*3/4, 0);
        limb(bodyW/4, bodyH*4/5, bodyW/4);
    popMatrix();

    // left arm.
    pushMatrix();
        translate(-bodyW/2 - bodyH/4, -bodyH*3/8 - bodyW/4, 0);
        rotateZ(PI/2);
        limb(bodyW/4, bodyH*4/5, bodyW/4);
    popMatrix();

    // right arm.
    pushMatrix();
        translate(bodyW/2 + bodyH/4, -bodyH*3/8 - bodyW/4, 0);
        rotateZ(-PI/2);
        limb(bodyW/4, bodyH*4/5, bodyW/4);
    popMatrix();
}

void limb(float w, float h, float d) {
    box(w, h/2, d);
    pushMatrix();
        translate(0, h/2 + h/10, 0);
        box(w, h/2, d);
    popMatrix();
}
