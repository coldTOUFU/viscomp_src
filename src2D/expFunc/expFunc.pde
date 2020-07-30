void setup(){
  size(100, 100);
  background(255);
  fill(0);
  drawGrid();
  drawQuad();
}

int funcY(int x) { return x*x - height/2; }
