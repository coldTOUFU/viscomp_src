void drawRadioExercise() {
    pushMatrix();
        translate(0, -width/4, 0);
        scale(50, 50, 50);
        rotateY(PI);
        fill(100);

        if(first.getCount() > 0) {
            first.setArmOmg(.03);
            first.exec();
        } else if(second.getCount() > 0) {
            second.setArmOmg(.05); second.setLegOmg(.05);
            second.exec();
        } else if(third.getCount() > 0) {
            third.setArmOmg(.075);
            third.exec();
        } else if(fourth.getCount() > 0) {
            fourth.setArmOmg(.05);
            fourth.setTrunkOmg(.05/7);
            fourth.exec();
        } else if(fifth.getCount() > 0) {
            fifth.setArmOmg(.08);
            fifth.setTrunkOmg(.08);
            fifth.exec();
        } else if(sixth.getCount() > 0) {
            sixth.setArmOmg(.03);
            sixth.setLegOmg(.03);
            sixth.setTrunkOmg(.03);
            sixth.exec();
        } else if(seventh.getCount() > 0) {
            seventh.setArmOmg(.04);
            seventh.setTrunkOmg(.08);
            seventh.exec();
        } else if(eighth.getCount() > 0) {
            eighth.setArmOmg(.05);
            eighth.setLegOmg(.05/6);
            eighth.exec();
        } else if(ninth.getCount() > 0) {
            ninth.setArmOmg(.025);
            ninth.setHipOmg(.025);
            ninth.setLegOmg(.025/3);
            ninth.exec();
        } else if(tenth.getCount() > 0) {
            tenth.setArmOmg(.05);
            tenth.setTrunkOmg(.05);
            tenth.setLegOmg(.05/3.);
            tenth.exec();
        } else if(eleventh.getCount() > 0) {
            eleventh.setV0(.5*G + 2.5); // .5*G + (top)/10
            eleventh.setDt(.05);
            eleventh.setArmOmg(.05);
            eleventh.setLegOmg(.05/3.);
            eleventh.exec();
        }
    popMatrix();
}
