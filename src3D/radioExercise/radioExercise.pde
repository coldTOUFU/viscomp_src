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
Jump eleventh;
LegExpansion twelveth;
DeepBreath thirteenth;

void setup() {
    size(1000, 1000, P3D);
    noStroke();
    
    PImage faceImg = loadImage("boyFace.png");
    PImage headImg = loadImage("hair.png");
    PImage frontTrunkImg = loadImage("blueJerseyFront.png");
    PImage trunkImg = loadImage("blueJersey.png");
    PImage hipImg = loadImage("blueJersey.png");
    PImage streightLimbImg = loadImage("blueJersey.png");
    PImage sideLimbImg = loadImage("blueJerseySide.png");
    
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
    tenth.setCount(/*4*/0);
    
    eleventh = new Jump();
    eleventh.setCount(16);

    twelveth = new LegExpansion();
    twelveth.setCount(/*8*/0);
    
    thirteenth = new DeepBreath();
    thirteenth.setCount(/*2*/0);
    
    // initialize for texture.
    Body[] bodies = {first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth, eleventh, twelveth, thirteenth};
    for (Body b: bodies) {
        b.setFaceImg(faceImg);
        b.setHeadImg(headImg);
        b.setFrontTrunkImg(frontTrunkImg);
        b.setTrunkImg(trunkImg);
        b.setHipImg(hipImg);
        b.setStreightLimbImg(streightLimbImg);
        b.setSideLimbImg(sideLimbImg);
    }
}

void draw() {
    background(255);
    fill(150);
    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
     
    pushMatrix();
        translate(0, -height/2, 0);
        box(width*5, 0, width*5);
        translate(0, height/4, 0);
        drawRadioExercise();
    popMatrix();
}
