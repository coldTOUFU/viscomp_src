DeepBreath first;

void setup() {
    size(600, 600, P3D);
    noStroke();
    
    // initialization for exercises.
    first = new DeepBreath();
    first.setCount(2);
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
