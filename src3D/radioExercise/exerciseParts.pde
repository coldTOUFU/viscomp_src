void wholeBody(float trunkX, float trunkY, float trunkZ,
               float ruArmX, float ruArmY, float ruArmZ, float rfArmX, float rfArmY, float rfArmZ,
               float luArmX, float luArmY, float luArmZ, float lfArmX, float lfArmY, float lfArmZ,
               float hipX, float hipY, float hipZ,
               float ruLegX, float ruLegY, float ruLegZ, float rfLegX, float rfLegY, float rfLegZ,
               float luLegX, float luLegY, float luLegZ, float lfLegX, float lfLegY, float lfLegZ) {
    translate(humanX, humanY, humanZ);
    translate(0, .7*(LIMB_Y*2 + JOINT), 0);
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
    
    translate(0, JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateHip(hipX, hipY, hipZ);
    popMatrix();
    rotateX(hipX); rotateY(hipY); rotateZ(hipZ); // rotation of hip affects other parts.
    translate(0, HIP_Y * 1.5, 0);

    
    translate(0, JOINT, 0);
    pushMatrix();
        scale(1.5);
        rotateTrunk(trunkX, trunkY, trunkZ);
    popMatrix();
    rotateX(trunkX); rotateY(trunkY); rotateZ(trunkZ); // rotation of trunk affects other parts.
    translate(0, TRUNK_Y * 1.5, 0);

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

    translate(0, HEAD_Y/2 + JOINT, 0);
    head();
}

class Exercise {
    protected int count;
    protected float armAng, legAng, trunkAng, hipAng;
    protected float armOmg, legOmg, trunkOmg, hipOmg; // Omega: angular velocity.
    protected float humanX, humanY, humanZ; // place of the center of human's head.
    
    public Exercise() {
        initializeVals();
    }
    
    protected void initializeVals() {
        armAng = legAng = trunkAng = hipAng = 0;
        armOmg = legOmg = trunkOmg = hipOmg = 0;
        humanX = humanY = humanZ = 0;
    }
    
    public void setCount(int i) {
        count = i;
    }
    
    public int getCount() {
        return count;
    }
    
    public void setArmOmg(float omg) {
        armOmg = omg;
    }
    
    public void setLegOmg(float omg) {
        legOmg = omg;
    }
    
    public void setTrunkOmg(float omg) {
        trunkOmg = omg;
    }
    
    public void setHipOmg(float omg) {
        hipOmg = omg;
    }
}

class DeepBreath extends Exercise {
    private boolean isBreathIn, isBreathOut;
  
    protected void initializeVals() {
        super.initializeVals();
        isBreathIn = true;
        isBreathOut = true;
    }
    
    private void breathIn() {   
        wholeBody(0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng += armOmg;
        
        if(armAng > PI) {
            isBreathIn = false;
            armAng = 0;
            return;
        }
    }
    
    private void breathOut() {      
        wholeBody(0, 0, 0,
              PI, 0, -armAng, 0, 0, 0,
              PI, 0, armAng, 0, 0, 0,
              0, 0, 0,
              0, 0, 0, 0, 0, 0,
              0, 0, 0, 0, 0, 0);
                  
        armAng += armOmg;
        
        if(armAng > PI) {
            isBreathOut = false;
            armAng = 0;
            count--;
        }
    }
    
    public void exec() {
        if(isBreathIn)       { breathIn(); }
        else if(isBreathOut) { breathOut(); }
    }
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
    if(armAng > PI*2) {
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
    } else if(armAng <= PI*3+PI/2) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng+PI, 0, 0, 0, // current_pos + former_pos.
                  0, 0, armAng-PI, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else {
        wholeBody(0, 0, 0,
                  0, 0, armAng, 0, 0, 0, // current_pos + former_pos, former_pos = PI*2 = 0.
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } //<>//
    
    armAng += armOmg;
    if(armAng > PI*6) {
        isArmRotation = false;
        initializeVals();
    }
}

void chestCurving() {
    if(armAng <= PI/2) {
        wholeBody(0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= PI*3/2) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng+PI, 0, 0, 0,
                  0, 0, armAng-PI, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= PI*5/2) {
        wholeBody(0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= PI*7/2) {
        wholeBody((armAng-PI*5/2)/6, 0, 0, // trunk's end angle of this block is PI / 6.
                  0, 0, (-armAng+PI*3)*7/6, 0, 0, 0, // arm's end angle of this block is PI * 7/6, while others are PI.
                  0, 0, (armAng-PI*3)*7/6, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= PI*4) {
        wholeBody((-armAng+PI*4)/3, 0, 0, // trunk's angle of this block is [PI / 6 -> 0].
                  0, 0, (armAng-PI*4)*7/6, 0, 0, 0, // arm's start angle of this block is PI * 7/6, while others are PI.
                  0, 0, (-armAng+PI*4)*7/6, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    }
    armAng += armOmg;
    if(armAng > PI*4) {
        isChestCurving = false;
        initializeVals();
    }
}

void bodyBendingBeside(boolean isRight) {
    if(armAng <= PI) {
        wholeBody(0, 0, 0,
                  0, 0, -armAng * btoi(!isRight), 0, 0, 0,
                  0, 0, armAng * btoi(isRight), 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    } else if(armAng <= PI*7/6) {
        wholeBody(0, 0, trunkAng * (float)Math.pow(-1, btoi(!isRight)),
                  0, 0, -PI * btoi(!isRight), 0, 0, -(armAng-PI) * btoi(!isRight),
                  0, 0, PI * btoi(isRight), 0, 0, (armAng-PI) * btoi(isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
        trunkAng += trunkOmg;
    } else if(armAng <= PI*8/6) {
        wholeBody(0, 0, trunkAng * (float)Math.pow(-1, btoi(!isRight)),
                  0, 0, -PI * btoi(!isRight), 0, 0, (armAng - PI*8/6) * btoi(!isRight),
                  0, 0, PI * btoi(isRight), 0, 0, -(armAng - PI*8/6) * btoi(isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
        trunkAng -= trunkOmg;
    } else if(armAng <= PI*14/6) {
        wholeBody(0, 0, 0,
                  0, 0, (armAng-PI*14/6) * btoi(!isRight), 0, 0, 0,
                  0, 0, -(armAng-PI*14/6) * btoi(isRight), 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
    }

    armAng += armOmg;
    if(armAng > PI*14/6) {
        isBodyBendingBeside = false;
        initializeVals();
    }
}

void bodyBendingBackForward() {
    if(legOmg > 0) {
        humanX = 2*sin(legAng);
        wholeBody(0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        legAng += legOmg;
        if(legAng > PI/6) {
            legOmg = -legOmg;
        }
    }
}
