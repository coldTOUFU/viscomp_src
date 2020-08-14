void drawRadioExercise() {
    pushMatrix();
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);
        isDeepBreath = isLegExpansion = false;
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
        }
    popMatrix();
}
