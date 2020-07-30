void setup(){
  size(600, 600);
  background(255);
  fill(0);
  smooth();
  drawParamGraph(drawGrid(10));
}

float xInWindow(float x, int unit){ return(x * unit + width / 2); }
float yInWindow(float y, int unit){ return(-y * unit + height / 2); }

int drawGrid(int maxVal){
    int unitPixels = width / maxVal / 2;
    int xc = width / 2, yc = height / 2;
    
    stroke(144, 238, 144);
    for(int i = 1 - maxVal; i < maxVal; i++){
        line(0, unitPixels * i + xc, width, unitPixels * i + yc);
        line(unitPixels * i + xc, 0, unitPixels * i + yc, height);
        if(i != 0){
            text(i, unitPixels * i + xc, yc + 18);
            text(i, xc - 14, unitPixels * i + yc + 5);
        }
    }
    stroke(0);
    text("0", xc - 14, yc + 18);
    line(0, yc, width, yc);
    line(xc, 0, xc, height);
    
    return unitPixels;
}

void drawParamGraph(int unit){
    float theta = .0, step = .1;
    float x1, y1, x2, y2;
    x2 = xInWindow(xFunc(theta), unit);
    y2 = yInWindow(yFunc(theta), unit);
    while(theta < TWO_PI){
        x1 = x2; y1 = y2;
        x2 = xInWindow(xFunc(theta += step), unit);
        y2 = yInWindow(yFunc(theta), unit);
        line(x1, y1, x2, y2);
    }
}

int n = 5, m = 6;
float a = 1, b = 1;
float sigma = 0;
float xFunc(float t) { return a*(cos(n*t)); }
float yFunc(float t) { return b*(cos(m*t + sigma)); }
