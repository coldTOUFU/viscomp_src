class Body {
    protected PImage faceImg, headImg, frontTrunkImg, trunkImg, hipImg, streightLimbImg, sideLimbImg;
    
    public void setFaceImg(PImage pi) {
        faceImg = pi;
    }
    
    public void setHeadImg(PImage pi) {
        headImg = pi;
    }
    
    public void setFrontTrunkImg(PImage pi) {
        frontTrunkImg = pi;
    }
    
    public void setTrunkImg(PImage pi) {
        trunkImg = pi;
    }
  
    public void setHipImg(PImage pi) {
        hipImg = pi;
    }
    
    public void setStreightLimbImg(PImage pi) {
        streightLimbImg = pi;
    }
    
    public void setSideLimbImg(PImage pi) {
        sideLimbImg = pi;
    }
  
    void head() { // face: front of head.
        pushMatrix();
            scale(HEAD_X, HEAD_Y, HEAD_Z);
            beginShape(QUADS);
            texture(faceImg);
            textureMode(NORMAL);
                vertex(-.5, .5, -.5, 0, 0); vertex(-.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, -.5, 1, 1); vertex(.5, .5, -.5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(headImg);
            textureMode(NORMAL);
                vertex(.5, .5, -.5, 0, 0); vertex(.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(.5, .5, .5, 0, 0); vertex(.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, .5, 1, 1); vertex(-.5, .5, .5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, -.5, 1, 1); vertex(-.5, .5, -.5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, .5, -.5, 0, 1);
                  vertex(.5, .5, -.5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(-.5, -.5, -.5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, -.5, -.5, 1, 0);
        endShape();
        popMatrix();
    }
    
    void trunk() { // frontTrunk: front of trunk.
        pushMatrix();
            scale(TRUNK_X, TRUNK_Y, TRUNK_Z);
            beginShape(QUADS);
            texture(frontTrunkImg);
            textureMode(NORMAL);
                vertex(-.5, .5, -.5, 0, 0); vertex(-.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, -.5, 1, 1); vertex(.5, .5, -.5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(trunkImg);
            textureMode(NORMAL);
                vertex(.5, .5, -.5, 0, 0); vertex(.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(.5, .5, .5, 0, 0); vertex(.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, .5, 1, 1); vertex(-.5, .5, .5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, -.5, 1, 1); vertex(-.5, .5, -.5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, .5, -.5, 0, 1);
                  vertex(.5, .5, -.5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(-.5, -.5, -.5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, -.5, -.5, 1, 0);
        endShape();
        popMatrix();
    }
    
    void hip() {
        pushMatrix();
            scale(HIP_X, HIP_Y, HIP_Z);
            beginShape(QUADS);
            texture(hipImg);
            textureMode(NORMAL);
                vertex(-.5, .5, -.5, 0, 0); vertex(-.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, -.5, 1, 1); vertex(.5, .5, -.5, 1, 0);
                vertex(.5, .5, -.5, 0, 0); vertex(.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(.5, .5, .5, 0, 0); vertex(.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, .5, 1, 1); vertex(-.5, .5, .5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, -.5, 1, 1); vertex(-.5, .5, -.5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, .5, -.5, 0, 1);
                  vertex(.5, .5, -.5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(-.5, -.5, -.5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, -.5, -.5, 1, 0);
        endShape();
        popMatrix();
    }
    
    void limb() { // streightLimb: forward and backward of limb; sideLimb: left and right of limb.
        pushMatrix();
            scale(LIMB_X, LIMB_Y, LIMB_Z);
            beginShape(QUADS);
            texture(streightLimbImg);
            textureMode(NORMAL);
                vertex(-.5, .5, -.5, 0, 0); vertex(-.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, -.5, 1, 1); vertex(.5, .5, -.5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(sideLimbImg);
            textureMode(NORMAL);
                vertex(.5, .5, -.5, 0, 0); vertex(.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, .5, .5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(streightLimbImg);
            textureMode(NORMAL);
                vertex(.5, .5, .5, 0, 0); vertex(.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, .5, 1, 1); vertex(-.5, .5, .5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(sideLimbImg);
            textureMode(NORMAL);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, -.5, 1, 1); vertex(-.5, .5, -.5, 1, 0);
            endShape();
            beginShape(QUADS);
            texture(streightLimbImg);
            textureMode(NORMAL);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, .5, -.5, 0, 1);
                  vertex(.5, .5, -.5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(-.5, -.5, -.5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, -.5, -.5, 1, 0);
        endShape();
        popMatrix();
    }
}
