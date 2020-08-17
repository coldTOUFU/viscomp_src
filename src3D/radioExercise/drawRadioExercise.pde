void drawRadioExercise() {
    pushMatrix();
        translate(0, -width/4, 0);
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);
        
        if(first.getCount() > 0) {
            first.setArmOmg(.05);
            first.exec();
        } else if(second.getCount() > 0) {
            second.setArmOmg(.05); second.setLegOmg(.05);
            second.exec();
        } else if(third.getCount() > 0) {
            third.setArmOmg(.05);
            third.exec();
        }
    popMatrix();
}
