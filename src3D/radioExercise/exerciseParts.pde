class Exercise extends Movements {
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
    
    protected void wholeBody(float trunkX, float trunkY, float trunkZ,
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
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isBreathIn)       { breathIn(); }
        else if(isBreathOut) { breathOut(); }
    }
}

class LegExpansion extends Exercise {
    private boolean isArmToChest, isBendLeg, isExpandLeg, isReturnToStandardPosture;
    
    protected void initializeVals() {
        super.initializeVals();
        isArmToChest = true;
        isBendLeg = true;
        isExpandLeg = true;
        isReturnToStandardPosture = true;
    }
    
    private void armToChest() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, +armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        
        if(armAng < -PI/2) {
            isArmToChest = false;
            armAng = -PI/2;
        }
    }
    
    private void bendLeg() {
        humanY = -.7 * LIMB_Y * ( 1 - (cos(legAng)+cos(legAng/2))/2 ); // leg * y_dif_by_bending_legs.

        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng/2, 0, 0, legAng,
                  0, 0, legAng/2, 0, 0, -legAng);
                  
        armAng += armOmg; //<>// //<>//
        legAng += legOmg;
        
        if(armAng > 0) {
            isBendLeg = false;
            armAng = 0;
            legAng = PI/2;
            humanY = (cos(PI/2)+cos(PI/4))/2;
        }
    }
    
    private void expandLeg() {
      humanY = -.7 * LIMB_Y * ( 1 - (cos(legAng)+cos(legAng/2))/2 );
      wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng/2, 0, 0, legAng,
                  0, 0, legAng/2, 0, 0, -legAng);

        armAng += armOmg; //<>// //<>//
        legAng -= legOmg;
        if(armAng > PI/2) {
            isExpandLeg = false;
            armAng = PI/2;
            legAng = 0;
            humanY = 0;
        }
    }
    
    private void returnToStandardPosture() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        
        if(armAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isArmToChest)                   { armToChest(); }
        else if(isBendLeg)                 { bendLeg(); }
        else if(isExpandLeg)               { expandLeg(); }
        else if(isReturnToStandardPosture) { returnToStandardPosture(); }
    }
}

class ArmRotation extends Exercise {
    private boolean isArmToChest, isRotateOut, isRotateIn;
  
    protected void initializeVals() {
        super.initializeVals();
        isArmToChest = true;
        isRotateOut = true;
        isRotateIn = true;
    }
    
    private void armToChest() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        
        if(armAng < -PI/2) {
            isArmToChest = false;
            armAng = -PI/2;
        }
    }
    
    private void rotateOut() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
       armAng += armOmg;
       
       if(armAng > PI*3 - PI/2) {
           isRotateOut = false;
           armAng = PI*3 - PI/2;
       }
    }
    
    private void rotateIn() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        
        if(armAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isArmToChest)     { armToChest(); }
        else if(isRotateOut) { rotateOut(); }
        else if(isRotateIn)  { rotateIn(); }
    }
}

class ChestCurving extends Exercise {
    private boolean isArmToChest, isArmUpHorizon, isCurveChest, isReturnToStandardPosture;
    
    protected void initializeVals() {
        super.initializeVals();
        isArmToChest = true;
        isArmUpHorizon = true;
        isCurveChest = true;
        isReturnToStandardPosture = true;
    }
    
    private void armToChest() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        
        if(armAng < -PI/2) {
            isArmToChest = false;
            armAng = -PI/2;
        }
    }
    
    private void armUpHorizon() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng += armOmg;
        
        if(armAng > PI/2) {
            isArmUpHorizon = false;
            isArmToChest = true;
            armAng = PI/2;
        }
    }
    
    private void curveChest() {
        wholeBody(trunkAng, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng += armOmg;
        trunkAng += trunkOmg;
        
        if(armAng > PI*2/3) {
            isCurveChest = false;
            armAng = PI*2/3;
            trunkAng = PI/6;
        }
    }
    
    private void returnToStandardPosture() {
        trunkOmg *= 2.;
        
        wholeBody(trunkAng, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        armAng -= armOmg;
        trunkAng -= trunkOmg;
        
        if(armAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isArmToChest)                   { armToChest(); }
        else if(isArmUpHorizon)            { armUpHorizon(); }
        else if(isCurveChest)              { curveChest(); }
        else if(isReturnToStandardPosture) { returnToStandardPosture(); }
    }
} //<>// //<>//

class BodyBendingBeside extends Exercise {
    private boolean isArmUp, isBendArm, isReturnArm, isDownArm;
    private boolean isRight;
    
    public BodyBendingBeside() {
        super();
        isRight = true;
    }
    
    protected void initializeVals() {
        super.initializeVals();
        isArmUp = true;
        isBendArm = true;
        isReturnArm = true;
        isDownArm = true;
    }
    
    private void armUp() {
        wholeBody(0, 0, 0, //<>//
                  0, 0, -armAng * btoi(!isRight), 0, 0, 0,
                  0, 0, armAng * btoi(isRight), 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
            
        armAng += armOmg;
                  
        if(armAng > PI) {
            isArmUp = false;
            armAng = 0;
        }
    }
    
    private void bendArm() {
        float dir = (float)Math.pow(-1, btoi(!isRight));
        trunkOmg /= 2;
        armOmg /= 2;
        
        wholeBody(0, 0, trunkAng * dir,
                  0, 0, -PI * btoi(!isRight), 0, 0, -armAng * btoi(!isRight),
                  0, 0, PI * btoi(isRight), 0, 0, armAng * btoi(isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        trunkAng += trunkOmg;
        armAng += armOmg;
        
        if(armAng > PI/6) {
            isBendArm = false;
            armAng = PI/6;
            trunkAng = PI/6;
        }
    }
    
    private void returnArm() {
        float dir = (float)Math.pow(-1, btoi(!isRight));
        trunkOmg /= 2;
        armOmg /= 2;
        
        wholeBody(0, 0, trunkAng * dir,
                  0, 0, -PI * btoi(!isRight), 0, 0, -armAng * btoi(!isRight),
                  0, 0, PI * btoi(isRight), 0, 0, armAng * btoi(isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        trunkAng -= trunkOmg;
        armAng -= armOmg;
        
        if(armAng < 0) {
            isReturnArm = false;
            armAng = PI;
            trunkAng = 0;
        }
    }
    
    private void armDown() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng * btoi(!isRight), 0, 0, 0,
                  0, 0, armAng * btoi(isRight), 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
            
        armAng -= armOmg;
                  
        if(armAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(Math.ceil(count / 2.) % 2 == 0) { isRight = true; }
        else               { isRight = false; }
        
        if(isArmUp)          { armUp(); }
        else if(isBendArm)   { bendArm(); }
        else if(isReturnArm) { returnArm(); }
        else if(isDownArm)   { armDown(); }
    }
}

class BodyBendingBackForward extends Exercise {
    private boolean isOpenLegs, isHipForward, isHipBackFromForward, isBendArm, isHipBackward, isHipBackFromBackward, isExpandArm;
    
    protected void initializeVals() {
        super.initializeVals();
        isOpenLegs = true;
        isHipForward = true;
        isHipBackFromForward = true;
        isBendArm = true;
        isHipBackward = true;
        isHipBackFromBackward = true;
        isExpandArm = true;
    }
    
    private void openLegs() {
        humanX = 2.*sin(legAng);
        
        wholeBody(0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        legAng += legOmg;
        
        if(legAng > PI/6) {
            isOpenLegs = false;
            legAng = PI/6;
        }
    }
    
    private void hipForward() {
        trunkOmg /= 2.;
        armOmg /= 2.;
      
        wholeBody(trunkAng, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        trunkAng -= trunkOmg;
        armAng += armOmg;
        
        if(trunkAng < -PI/2) {
            isHipForward = false;
            trunkAng = -PI/2;
            armAng = PI/2;
        }
    }
    
    private void hipBackFromForward() {
        trunkOmg /= 2.;
        armOmg /= 2.;
      
        wholeBody(trunkAng, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  armAng, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        trunkAng += trunkOmg;
        armAng -= armOmg;
        
        if(trunkAng > 0) {
            isHipBackFromForward = false;
            trunkAng = 0;
            armAng = 0;
        }
    }
    
    private void bendArm() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng/2, 0, 0, armAng,
                  0, 0, armAng/2, 0, 0, -armAng,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        armAng += armOmg;
        
        if(armAng > PI/2) {
            isBendArm = false;
            armAng = PI/2;
        }
    }
    
    private void hipBackward() {
        trunkOmg /= 2;
      
        wholeBody(trunkAng, 0, 0,
                  0, 0, -armAng/2, 0, 0, armAng,
                  0, 0, armAng/2, 0, 0, -armAng,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        trunkAng += trunkOmg;
        
        if(trunkAng > PI/3) {
            isHipBackward = false;
            trunkAng = PI/3;
        }
    }
    
    private void hipBackFromBackward() {
        wholeBody(trunkAng, 0, 0,
                  0, 0, -armAng/2, 0, 0, armAng,
                  0, 0, armAng/2, 0, 0, -armAng,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        trunkAng -= trunkOmg;
        
        if(trunkAng < 0) {
            isHipBackFromBackward = false;
            trunkAng = 0;
        }
    }
    
    private void expandArm() {
        humanX = 2.*sin(legAng);
        legOmg *= 2./6.;

        wholeBody(0, 0, 0,
                  0, 0, -armAng/2, 0, 0, armAng,
                  0, 0, armAng/2, 0, 0, -armAng,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        armAng -= armOmg;
        legAng -= legOmg;
        
        if(armAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isOpenLegs)                 { openLegs(); }
        else if(isHipForward)          { hipForward(); }
        else if(isHipBackFromForward)  { hipBackFromForward(); }
        else if(isBendArm)             { bendArm(); }
        else if(isHipBackward)         { hipBackward(); }
        else if(isHipBackFromBackward) { hipBackFromBackward(); }
        else if(isExpandArm)           { expandArm(); }
    }
}

class BodyTwisting extends Exercise {
    private boolean isTwistArmSmall, isTwistArmBig, isBackTwistArm;
    private boolean isRight;
    private int shakeCount;

    public BodyTwisting() {
        super();
        isRight = false;
    }

    protected void initializeVals() {
        super.initializeVals();
        isTwistArmSmall = true;
        isTwistArmBig = true;
        isBackTwistArm = false;
        shakeCount = 7;
    }
    
    private void twistArmSmall() {
        float dir = (float)Math.pow(-1, btoi(isRight));

        wholeBody(0, trunkAng * dir, 0,
                  0, 0, -armAng * dir * btoi(!isRight), 0, 0, -armAng * dir * btoi(isRight),
                  0, 0, -armAng * dir * btoi(isRight), 0, 0, -armAng * dir * btoi(!isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        trunkAng += trunkOmg;
        armAng += armOmg;
        
        if(armAng > PI/4) {
            isTwistArmSmall = false;
            isBackTwistArm = true;
            trunkAng = PI/2;
            armAng = PI/4;
            shakeCount--;
        }
    }
    
    private void twistArmBig() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        armOmg *= 2.;
        
        wholeBody(0, trunkAng * dir, 0,
                  0, 0, -armAng * dir * btoi(!isRight), 0, 0, -armAng * dir * btoi(isRight),
                  0, 0, -armAng * dir * btoi(isRight), 0, 0, -armAng * dir * btoi(!isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        trunkAng += trunkOmg;
        armAng += armOmg;
        
        if(armAng > PI*3/4) {
            isTwistArmBig = false;
            isBackTwistArm = true;
            trunkAng = PI*3/4;
            armAng = PI*3/4;
            shakeCount--;
        }
    }
    
    private void backTwistArm() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        if(shakeCount <= 2 && shakeCount % 2 == 0) { armOmg *= 2.; }

        wholeBody(0, trunkAng * dir, 0, //<>// //<>//
                  0, 0, -armAng * dir * btoi(!isRight), 0, 0, -armAng * dir * btoi(isRight),
                  0, 0, -armAng * dir * btoi(isRight), 0, 0, -armAng * dir * btoi(!isRight),
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);
                  
        trunkAng -= trunkOmg;
        armAng -= armOmg;
        
        if(armAng < 0) {
            isBackTwistArm = false;
            if(shakeCount > 3 || shakeCount % 2 == 0) { isTwistArmSmall = true; isTwistArmBig = false; }
            else if(shakeCount > 0)                   { isTwistArmBig = true; isTwistArmSmall = false; }
            else                                      { initializeVals(); isRight = !isRight; count--; }

            trunkAng = 0;
            armAng = 0;
            isRight = !isRight;
        }
    }
    
    public void exec() {
        if(isBackTwistArm)       { backTwistArm(); }
        else if(isTwistArmSmall) { twistArmSmall(); }
        else if(isTwistArmBig)   { twistArmBig(); }
    }
}

class ShoulderBending extends Exercise {
    private boolean isBendShoulder, isArmUp, isBackShoulder, isReturnToStandardPosture;
    private boolean isRight;
    
    public ShoulderBending() {
        super();
        isRight = true;
    }    
    
    protected void initializeVals() {
        super.initializeVals();
        isBendShoulder = true;
        isArmUp = true;
        isBackShoulder = true;
        isReturnToStandardPosture = true;
    }
    
    private void bendShoulder() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        humanX = 2.*sin(legAng)*dir;

        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, -armAng*3/2,
                  0, 0, armAng, 0, 0, armAng*3/2,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
        
        armAng += armOmg;
        legAng += legOmg;
        
        if(armAng > PI/2) {
            armAng = PI/2;
            legAng = PI/12;
            humanX = 2.*sin(PI/12)*dir;
            isBendShoulder = false;
        }          
    }
    
    private void armUp() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, -PI*6/4 + armAng*3/2,
                  0, 0, armAng, 0, 0, PI*6/4 - armAng*3/2,
                  0, 0, 0,
                  0, 0, -PI/12, 0, 0, 0,
                  0, 0, PI/12, 0, 0, 0);
        
        armAng += armOmg;
        
        if(armAng > PI) {
            armAng = PI;
            isArmUp = false;
        }
    }
    
    private void backShoulder() {
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, -PI*6/4 + armAng*3/2,
                  0, 0, armAng, 0, 0, PI*6/4 - armAng*3/2,
                  0, 0, 0,
                  0, 0, -PI/12, 0, 0, 0,
                  0, 0, PI/12, 0, 0, 0);
        
        armAng -= armOmg;
        
        if(armAng < PI/2) {
            armAng = PI/2;
            isBackShoulder = false;
        }
    }
    
    private void returnToStandardPosture() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        humanX = 2.*sin(legAng)*dir;

        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, -armAng*3/2,
                  0, 0, armAng, 0, 0, armAng*3/2,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
        
        armAng -= armOmg;
        legAng -= legOmg;
        
        if(armAng < 0) {
            initializeVals();
            isRight = !isRight;
            count--;
        }
    }
    
    public void exec() {
        if(isBendShoulder)                 { bendShoulder(); }
        else if(isArmUp)                   { armUp(); }
        else if(isBackShoulder)            { backShoulder(); }
        else if(isReturnToStandardPosture) { returnToStandardPosture(); }
    }
}

class HipBending extends Exercise {
    private boolean isBendHip, isReturnHip, isOpenArm, isReturnArm;
    private boolean isRight;
    
    public HipBending() {
        super();
        isRight = true;
    }
    
    protected void initializeVals() {
        super.initializeVals();
        isBendHip = true;
        isReturnHip = true;
        isOpenArm = true;
        isReturnArm = true;
    }
    
    private void bendHip() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        humanX = 2.*sin(legAng)*dir;

        wholeBody(0, 0, 0,
                  armAng, 0, armAng/6, 0, 0, 0,
                  armAng, 0, -armAng/6, 0, 0, 0,
                  -hipAng, -hipAng/2*dir, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
         
        armAng += armOmg;
        hipAng += hipOmg;
        legAng += legOmg;
        
        if(armAng > PI/2) {
            armAng = PI/2;
            hipAng = PI/2;
            legAng = PI/6;
            isBendHip = false;
        }
    }
    
    private void returnHip() {
        float dir = (float)Math.pow(-1, btoi(isRight));
        humanX = 2.*sin(legAng)*dir;

        wholeBody(0, 0, 0,
                  armAng, 0, armAng/6, 0, 0, 0,
                  armAng, 0, -armAng/6, 0, 0, 0,
                  -hipAng, -hipAng/2*dir, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
         
        armAng -= armOmg;
        hipAng -= hipOmg;
        legAng -= legOmg;
        
        if(armAng < 0) {
            armAng = 0;
            hipAng = 0;
            legAng = 0;
            isReturnHip = false;
        }
    }
    
    private void openArm() {
        armOmg /= 2.;
      
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);

        armAng += armOmg;

        if(armAng > PI/6) {
            armAng = PI/6;
            isOpenArm = false;
        }
    }

    private void returnArm() {
      
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0);

        armAng -=armOmg;

        if(armAng < 0) {
            initializeVals();
            isRight = !isRight;
            count--;
        }
    }

    public void exec() {
        if(isBendHip)        { bendHip(); }
        else if(isReturnHip) { returnHip(); }
        else if(isOpenArm)   { openArm(); }
        else if(isReturnArm) { returnArm(); }
    }
}

class BodyBigRotation extends Exercise {
    private boolean isOpenLeg, isArmUp, isRotateBodyDown, isRotateBodyUp, isCloseLeg;
    private boolean isRight;
    
    public BodyBigRotation() {
        super();
        isOpenLeg = true; // is used only at first time.
        isCloseLeg = false; // is used only at last time.
        isRight = true;
    }
    
    protected void initializeVals() {
        super.initializeVals();
        isArmUp = true;
        isRotateBodyDown = true;
        isRotateBodyUp = true;
    }
    
    private void openLeg() {
        humanX = 2.*sin(legAng);
        
        wholeBody(0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        legAng += legOmg;
        
        if(legAng > PI/6) {
            isOpenLeg = false;
            legAng = PI/6;
        }
    }
    
    private void armUp() {
        legAng = PI/6;
        float dir = (float)Math.pow(-1, btoi(!isRight));
        humanX = 2.*sin(PI/6);
         //<>//
        wholeBody(0, 0, - PI/6 * sin(trunkAng) * dir,
                  0, 0, armAng * dir, 0, 0, 0,
                  0, 0, armAng * dir, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
            
        armAng += armOmg;
        trunkAng += trunkOmg;
                  
        if(armAng > PI/2) {
            isArmUp = false;
            armAng = 0;
            trunkAng = PI/2;
        }
    }
    
    private void rotateBodyDown() {
        float dir = (float)Math.pow(-1, btoi(!isRight));
        humanX = 2.*sin(PI/6);
        
        wholeBody(PI/4 * cos(trunkAng), 0, - PI/6 * sin(trunkAng) * dir,
                  0, armAng * dir, PI/2 * dir, 0, 0, 0,
                  0, armAng * dir, PI/2 * dir, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -PI/6, 0, 0, 0,
                  0, 0, PI/6, 0, 0, 0);
            
        armAng += armOmg;
        trunkAng += trunkOmg;
                  
        if(armAng > PI) {
            isRotateBodyDown = false;
            armAng = PI/2;
            trunkAng = -PI/2;
        }
    }
    
    private void rotateBodyUp() {
        float dir = (float)Math.pow(-1, btoi(!isRight));
        humanX = 2.*sin(PI/6);
        
        wholeBody(0, 0, - PI/6 * sin(trunkAng) * dir,
                  0, -PI, armAng * dir, 0, 0, 0,
                  0, -PI, armAng * dir, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -PI/6, 0, 0, 0,
                  0, 0, PI/6, 0, 0, 0);
                  
        armAng += armOmg;
        trunkAng += trunkOmg;
        
        if(armAng > PI*2) {
            isRotateBodyUp = false;
            isRight = ! isRight;
            if(count <= 1) {
                isCloseLeg = true;
                isRotateBodyUp = false;
            } else {
                initializeVals();
                count--;
            }
        }
    }
    
    private void closeLeg() {
        humanX = 2.*sin(legAng);
        
        wholeBody(0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
                  
        legAng -= legOmg;
        
        if(legAng < 0) {
            initializeVals();
            count--;
        }
    }
    
    public void exec() {
        if(isOpenLeg)             { openLeg(); }
        else if(isArmUp)          { armUp(); }
        else if(isRotateBodyDown) { rotateBodyDown(); }
        else if(isRotateBodyUp)   { rotateBodyUp(); }
        else if(isCloseLeg)       { closeLeg(); }
    }
}

class Jump extends Exercise {
    private float t, dt;
    private float v_0;
    
    public Jump() {
        super();
        v_0 = 0;
    }
    
    protected void initializeVals() {
        t = 0;
    }
    
    public void setDt(float f) {
        dt = f;
    }
    
    public void setV0(float f) {
        v_0 = f;
    }

    public void exec() {
        humanY = v_0 * t - .5 * G * t*t;
        if(humanY < 0) {
            t = 0;
            humanY = 0;
            count--;
        }
        
        if(Math.ceil(count / 4.) % 2 == 1) {
            if(count % 2 == 0) { // open body;
                armAng += armOmg;
                legAng += legOmg;
            }
            else {               // close body;
                armAng -= armOmg;
                legAng -= legOmg;
            }
        }
        
        wholeBody(0, 0, 0,
                  0, 0, -armAng, 0, 0, 0,
                  0, 0, armAng, 0, 0, 0,
                  0, 0, 0,
                  0, 0, -legAng, 0, 0, 0,
                  0, 0, legAng, 0, 0, 0);
        
        t += dt;
        
        if(count <= 0) {
            initializeVals();
        }
    }
}
