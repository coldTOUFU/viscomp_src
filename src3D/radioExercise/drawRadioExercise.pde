void drawRadioExercise() {
    pushMatrix();
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);
        if(isDeepBreath) {
            armOmg = .05;
            deepBreath();
        }
    popMatrix();
}
