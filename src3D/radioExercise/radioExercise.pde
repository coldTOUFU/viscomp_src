DeepBreath first;
LegExpansion second;
ArmRotation third;
ChestCurving fourth;
BodyBendingBeside fifth;
BodyBendingBackForward sixth;
BodyTwisting seventh;

void setup() {
    size(600, 600, P3D);
    noStroke();
    
    // initialization for exercises.
    first = new DeepBreath();
    first.setCount(0);
    
    second = new LegExpansion();
    second.setCount(0);
    
    third = new ArmRotation();
    third.setCount(0);
    
    fourth = new ChestCurving();
    fourth.setCount(0);
    
    fifth = new BodyBendingBeside();
    fifth.setCount(0);
    
    sixth = new BodyBendingBackForward();
    sixth.setCount(0);
    
    seventh = new BodyTwisting();
    seventh.setCount(2);
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
