void setup() {
    size(600, 600, P3D);
    noStroke();
    
    // initialization for exercises.
    isDeepBreath = isLegExpansion = isArmRotation = isChestCurving =
    isBodyBendingBeside = isBodyBendingBackForward = isBodyTwinsting =
    isArmExpansionUpward = isBodyCurveDiagonaly = isBodyRotation = isJump = true;
}

void draw() {
    background(255);
    fill(150);
    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    pushMatrix();
        drawRadioExercise();
    popMatrix();
}
