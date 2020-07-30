size(500, 500);
background(255);
int hue_max = 128;
colorMode(HSB, hue_max, 100, 100);

int out_r = width / 3;
int in_r = width / 8;
for (int i = 0; i < hue_max; i++) {
    stroke(i, 100, 100);
  
    float theta = TWO_PI * i / hue_max;
    int x_in, y_in, x_out, y_out;
    x_in = int(in_r * cos(theta) + width / 2);
    y_in = int(in_r * sin(theta) + height / 2);
    x_out = int(out_r * cos(theta) + width / 2);
    y_out = int(out_r * sin(theta) + height / 2);
  
    line(x_in, y_in, x_out, y_out);
}
