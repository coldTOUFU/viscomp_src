void wholeBody(float trunkX, float trunkY, float trunkZ,
               float ruArmX, float ruArmY, float ruArmZ, float rfArmX, float rfArmY, float rfArmZ,
               float luArmX, float luArmY, float luArmZ, float lfArmX, float lfArmY, float lfArmZ,
               float hipX, float hipY, float hipZ,
               float ruLegX, float ruLegY, float ruLegZ, float rfLegX, float rfLegY, float rfLegZ,
               float luLegX, float luLegY, float luLegZ, float lfLegX, float lfLegY, float lfLegZ) {
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
    if(armAng < PI) {
        wholeBody(0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    }else if(PI <= armAng) {
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
