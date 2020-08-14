void wholeBody(float trunkX, float trunkY, float trunkZ,
               float ruArmX, float ruArmY, float ruArmZ, float rfArmX, float rfArmY, float rfArmZ,
               float luArmX, float luArmY, float luArmZ, float lfArmX, float lfArmY, float lfArmZ,
               float hipX, float hipY, float hipZ,
               float ruLegX, float ruLegY, float ruLegZ, float rfLegX, float rfLegY, float rfLegZ,
               float luLegX, float luLegY, float luLegZ, float lfLegX, float lfLegY, float lfLegZ) {
    translate(humanX, humanY, humanZ);
                 
    head();
    translate(0, -HEAD_Y/2 - JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateTrunk(trunkX, trunkY, trunkZ);
    popMatrix();
    pushMatrix();
        translate(-TRUNK_X/2 * 1.5 - JOINT, 0, 0);
        scale(.65);
        translate(-LIMB_X/2, 0, 0);
        rotateLimb(ruArmX, ruArmY, ruArmZ, rfArmX, rfArmY, rfArmZ);
    popMatrix();
    pushMatrix();
        translate(TRUNK_X/2 * 1.5 + JOINT, 0, 0);
        scale(.65);
        translate(LIMB_X/2, 0, 0);
        rotateLimb(luArmX, luArmY, luArmZ, lfArmX, lfArmY, lfArmZ);
    popMatrix();
    translate(0, -TRUNK_Y * 1.5 - JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateHip(hipX, hipY, hipZ);
    popMatrix();
    translate(0, -HIP_Y * 1.5 - JOINT, 0);
    pushMatrix();
        translate(-TRUNK_X/4 * 1.5, 0, 0);
        scale(.7);
        rotateLimb(ruLegX, ruLegY, ruLegZ, rfLegX, rfLegY, rfLegZ);
    popMatrix();
    pushMatrix();
        translate(TRUNK_X/4 * 1.5, 0, 0);
        scale(.7);
        rotateLimb(luLegX, luLegY, luLegZ, lfLegX, lfLegY, lfLegZ);
    popMatrix();
}

void deepBreath() {
    if(armAng <= PI) {
        wholeBody(0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(PI <= armAng) {
        wholeBody(0, 0, 0,
              PI, 0, -armAng+PI, 0, 0, 0,
              PI, 0, armAng-PI, 0, 0, 0,
              0, 0, 0,
              0, 0, 0, 0, 0, 0,
              0, 0, 0, 0, 0, 0);
    }

    armAng += armOmg;
    if(armAng > 2*PI) {
        isDeepBreath = false;
        initializeVals();
    }
}

void legExpansion() {
    if(armAng >= -PI/2 && armAng <= 0 && legAng == 0) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
        armAng -= armOmg;
    } else if(armAng <= 0) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng/2, 0, 0, legAng,
                  0, 0, legAng/2, 0, 0, -legAng);
        armAng += armOmg;
        legAng += legOmg;
        humanY = -.7 * LIMB_Y * ( 1 - (cos(legAng)+cos(legAng/2))/2 ); // leg * y_dif_by_bending_legs.
    } else if(armAng <= PI/2) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng/2, 0, 0, legAng,
                  0, 0, legAng/2, 0, 0, -legAng);
        armAng += armOmg;
        legAng -= legOmg;
        humanY = -.7 * LIMB_Y * ( 1 - (cos(legAng)+cos(legAng/2))/2 ); // leg * y_dif_by_bending_legs.
    } else {
        wholeBody(0, 0, 0,
                  0, 0, -PI+armAng, 0, 0, 0,
                  0, 0, PI-armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
        armAng += armOmg;
    }
    
    if(armAng > PI) {
        isLegExpansion = false;
        initializeVals();
    }
}

void armRotation() {
    if(armAng <= PI/2) {
        wholeBody(0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= 3*PI+PI/2) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng+PI, 0, 0, 0, // current_pos + former_pos.
                  0, 0, armAng-PI, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else {
        wholeBody(0, 0, 0,
                  0, 0, armAng, 0, 0, 0, // current_pos + former_pos, former_pos = 2*PI = 0.
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } //<>//
    
    armAng += armOmg;
     if(armAng > 6*PI) {
        isArmRotation = false;
        initializeVals();
    }
}
