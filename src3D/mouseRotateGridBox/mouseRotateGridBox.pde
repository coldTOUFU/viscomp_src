void setup(){
    size(600, 600, P3D);
    noStroke();
    lights();
}

void draw(){
    background(255);
    translate(width/2, height/2, -width/2);
    rotateX(map(mouseY, 0, height, PI, -PI));
    rotateY(map(mouseX, 0, width, -PI, PI));
    gridCubes();
}

void gridCubes() {
    int cubeNum = 11;
    /* colorBase: to standarize color in [0, 255]. */
    float colorBase = cubeNum/2 * 255/cubeNum, colorDelta = 255/cubeNum;
    float boxSize = width/20, space = boxSize*2;
    lights();
    fill(255, 255, 0);

    for(int i=-cubeNum/2; i<(cubeNum+1)/2; i++) {
        for(int j=-cubeNum/2; j<(cubeNum+1)/2; j++) {
            for(int k=-cubeNum/2; k<(cubeNum+1)/2; k++) {
                pushMatrix();
                    fill(colorBase + i*colorDelta, colorBase + j*colorDelta, colorBase + k*colorDelta);
                    translate(i*space, j*space, k*space);
                    box(boxSize);
                popMatrix();
            }
        }
    }

}
