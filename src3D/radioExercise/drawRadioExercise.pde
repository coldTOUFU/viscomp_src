void drawRadioExercise() {
    pushMatrix();
        translate(0, -width/4, 0);
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);
        isDeepBreath = isLegExpansion = isArmRotation = isChestCurving = false;
        if(isDeepBreath) {
            armOmg = .05;
            deepBreath();
        } else if(isLegExpansion) {
            armOmg = .05;
            legOmg = .05;
            legExpansion();
        } else if(isArmRotation) {
            armOmg = .05;
            armRotation();
        } else if(isChestCurving) {
            armOmg = .05;
            chestCurving();
        } else if(isBodyBendingBeside) {
            armOmg = trunkOmg = .05;
            bodyBendingBeside(true);
        }
        //testMovements();
    popMatrix();
}
