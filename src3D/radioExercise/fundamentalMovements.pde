void rotateTrunk(float xAng, float yAng, float zAng) {
    rotateX(xAng); rotateY(yAng); rotateZ(zAng);
    translate(0, -.875, 0); // trunk: box(1., 1.75, .75);. called place will be root of trunk, neck.
    trunk();
}

void rotateHip(float xAng, float yAng, float zAng) {
    rotateX(xAng); rotateY(yAng); rotateZ(zAng);
    translate(0, -.25, 0); // hip: box(1., .5, .75);. called place will be root of hip.
    hip();
}

void rotateLimb(float xAngUpper, float yAngUpper, float zAngUpper, float xAngFore, float yAngFore, float zAngFore) {
    rotateX(xAngUpper); rotateY(yAngUpper); rotateZ(zAngUpper);
    translate(0, -1.25, 0); // limb: box(1., 2.5, 2.5);. called place will be root of upper limb.
    limb(); // upper limb.
    
    translate(0, -1.25, 0); // root of fore limb.
    rotateX(xAngFore); rotateY(yAngFore); rotateZ(zAngFore);
    translate(0, -1.25 - .25, 0); // limb/2 + gap.
    limb();
}

void testMovements() {
    head();
    translate(0, -HEAD_Y/2 - JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateTrunk(0, 0, 0);
    popMatrix();
    pushMatrix();
        translate(-TRUNK_X/2 * 1.5 - JOINT, 0, 0);
        scale(.65);
        translate(-LIMB_X/2, 0, 0);
        rotateLimb(0, 0, 0, 0, 0, 0);
    popMatrix();
    pushMatrix();
        translate(TRUNK_X/2 * 1.5 + JOINT, 0, 0);
        scale(.65);
        translate(LIMB_X/2, 0, 0);
        rotateLimb(0, 0, 0, 0, 0, 0);
    popMatrix();
    translate(0, -TRUNK_Y * 1.5 - JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateHip(0, 0, 0);
    popMatrix();
    translate(0, -HIP_Y * 1.5 - JOINT, 0);
    pushMatrix();
        translate(-TRUNK_X/4 * 1.5, 0, 0);
        scale(.7);
        rotateLimb(0, 0, 0, 0, 0, 0);
    popMatrix();
    pushMatrix();
        translate(TRUNK_X/4 * 1.5, 0, 0);
        scale(.7);
        rotateLimb(0, 0, 0, 0, 0, 0);
    popMatrix();
}
