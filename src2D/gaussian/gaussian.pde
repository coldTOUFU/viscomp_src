PImage src;
float[][] gaussianFilter;
int w = 5; // フィルター幅．
int hw = int(w / 2); // フィルター幅の半分．

void setup() {
    size(240, 150);
    background(255);
    src = loadImage("http://img2.hc.uec.ac.jp/~rocky/lecture/VisComp/rocky.jpg");
    image(src, 0, 0);
    
    gaussianFilter = gaussian(1);
    image(filtering(src, gaussianFilter), src.width, 0);
}

PImage filtering(PImage img, float f[][]) {
    PImage filteredImg = createImage(img.width, img.height, RGB);
    img.loadPixels();
    filteredImg.loadPixels();
    for(int j = hw; j < img.height - hw; j++) {
        for(int i = hw; i < img.width - hw; i++) {
            float sum_r = .0, sum_g = .0, sum_b = .0;
            for(int l = -hw; l <= hw; l++) {
                for(int k = -hw; k <= hw; k++) {
                    int p = (j + l) * img.width + i + k;
                    sum_r += f[l + hw][k + hw] * red(img.pixels[p]);
                    sum_g += f[l + hw][k + hw] * green(img.pixels[p]);
                    sum_b += f[l + hw][k + hw] * blue(img.pixels[p]);
                }
            }
            filteredImg.pixels[j * img.width + i] = color(sum_r, sum_g, sum_b);
        }
    }
    filteredImg.updatePixels();
    return(filteredImg);
}

float[][] gaussian(float s) {
    float[][] filter = new float[w][w];
    float sum = 0;
    for(int j = -hw; j <= hw; j++) {
        for(int i = -hw; i <= hw; i++) {
            sum += filter[j + hw][i + hw] = exp( -(i*i + j*j) / 2. / s / s);
        }
    }
    
    for(int i = 0; i < w*w; i++) { filter[int(i/w)][i%w] /= sum; }
    
    return filter;
}
