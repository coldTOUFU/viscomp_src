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
        } else if(fourth.getCount() > 0) {
            fourth.setArmOmg(.05);
            fourth.setTrunkOmg(.05/7);
            fourth.exec();
        } else if(fifth.getCount() > 0) {
            fifth.setArmOmg(.05);
            fifth.setTrunkOmg(.05);
            fifth.exec();
        } else if(sixth.getCount() > 0) {
            sixth.setArmOmg(.05);
            sixth.setLegOmg(.05);
            sixth.setTrunkOmg(.05);
            sixth.exec();
        } else if(seventh.getCount() > 0) {
            seventh.setArmOmg(.05);
            seventh.setTrunkOmg(.1);
            seventh.exec();
        } else if(eighth.getCount() > 0) {
            eighth.setArmOmg(.05);
            eighth.setLegOmg(.05/6);
            eighth.exec();
        }
    popMatrix();
}
