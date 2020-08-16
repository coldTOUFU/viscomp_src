void drawRadioExercise() {
    pushMatrix();
        translate(0, -width/4, 0);
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);
        
        if(first.getCount() > 0) {
            first.setArmOmg(.05);
            first.exec(); //<>//
        }
    popMatrix();
}
