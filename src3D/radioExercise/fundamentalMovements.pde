float armAng, legAng, bodyAng = 0; // only 3 are enough, using symmetry.

void rotateTrunk(float xAng, float yAng, float zAng) {
    rotateX(xAng); rotateY(yAng); rotateZ(zAng);
    translate(0, .25, 0); // trunk: box(1., 2.5, 1.);. called place will be root of trunk, neck.
    trunk();
}

void rotateHip(float xAng, float yAng, float zAng) {
    rotateX(xAng); rotateY(yAng); rotateZ(zAng);
    translate(0, .25, 0); // hip: box(1., .5, .5);. called place will be root of hip.
    hip();
}

void rotateLimb(float xAngUpper, float yAngUpper, float zAngUpper, float xAngFore, float yAngFore, float zAngFore) {
    rotateX(xAngUpper); rotateY(yAngUpper); rotateZ(zAngUpper);
    translate(0, 1.25, 0); // limb: box(1., 2.5, 2.5);. called place will be root of upper limb.
    limb(); // upper limb.
    
    translate(0, 1.25, 0); // root of fore limb.
    rotateX(xAngFore); rotateY(yAngFore); rotateZ(zAngFore);
    translate(0, 1.25 + .5, 0); // .5 is gap between limbs.
    limb();
}

void testRotateLimb() {
    rotateLimb(armAng, 0, 0, 0, 0, 0);
    armAng += .1;
}
