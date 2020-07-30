void setup(){
    size(600, 600);
    background(255);
    textFont(createFont("Tempus SamsITC", 18));
    textAlign(CENTER);
    fill(0);
    smooth();
    drawParamFuncs(drawGrid(10));
}
