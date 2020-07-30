void drawParamFuncs(int unit){
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
