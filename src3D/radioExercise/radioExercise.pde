DeepBreath first;
LegExpansion second;
ArmRotation third;
ChestCurving fourth;
BodyBendingBeside fifth;
BodyBendingBackForward sixth;
BodyTwisting seventh;
ShoulderBending eighth;
HipBending ninth;
BodyBigRotation tenth;

void setup() {
    size(600, 600, P3D);
    noStroke();
    
    // initialization for exercises.
    first = new DeepBreath();
    first.setCount(/*2*/0);
    
    second = new LegExpansion();
    second.setCount(/*8*/0);
    
    third = new ArmRotation();
    third.setCount(/*4*/0);
    
    fourth = new ChestCurving();
    fourth.setCount(/*4*/0);
    
    fifth = new BodyBendingBeside();
    fifth.setCount(/*8*/0);
    
    sixth = new BodyBendingBackForward();
    sixth.setCount(/*2*/0);
    
    seventh = new BodyTwisting();
    seventh.setCount(/*2*/0);
    
    eighth = new ShoulderBending();
    eighth.setCount(/*4*/0);
    
    ninth = new HipBending();
    ninth.setCount(/*4*/0);
    
    tenth = new BodyBigRotation();
    tenth.setCount(4);
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
