void drawQuad(){
  for(int x=0; x < height; x++) {
    fill(0);
    point(x, funcY(x));
    System.out.println(x);
    System.out.println(funcY(x));
  }
}
