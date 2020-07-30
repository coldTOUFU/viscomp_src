void drawGrid() {
  int d = height / 20; // width = height を仮定．
  for(int i = d; i < height; i += d) {
      if(i == height / 2) { stroke(0); }
      else { stroke(0, 255, 0); }
  
      line(i, 0, i, height);
      line(0, i, width, i);
  }
}
