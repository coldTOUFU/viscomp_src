PImage src;
float[][] gaussianFilter;
int w = 5;
int hw = int(w / 2);

void setup() {
    size(750, 150);
    background(255);
    src = loadImage("lena.jpg");
    image(src, 0, 0);
    
    gaussianFilter = gaussian(1);

    PImage fltedImg = src;
    for(int i = 1; i <= 5; i++) {
        fltedImg = bilateralFiltering(fltedImg, gaussianFilter, 20);
        image(fltedImg, src.width*i, 0);
    }
}

PImage bilateralFiltering(PImage img, float gf[][], float s) {
    PImage filteredImg = createImage(img.width, img.height, RGB);
    img.loadPixels();
    filteredImg.loadPixels();
    for(int j = hw; j < img.height - hw; j++) {
        for(int i = hw; i < img.width - hw; i++) {
            float sum_r = .0, sum_g = .0, sum_b = .0;
            float sum_below_r = 0, sum_below_g = 0, sum_below_b = 0;
            for(int l = -hw; l <= hw; l++) { // iteration of peripheral px.
                for(int k = -hw; k <= hw; k++) {
                    int p0 = j * img.width + i;
                    int p = (j + l) * img.width + i + k;
                    float px_r0 = red(img.pixels[p0]), px_g0 = green(img.pixels[p0]), px_b0 = blue(img.pixels[p0]);
                    float px_r = red(img.pixels[p]), px_g = green(img.pixels[p]), px_b = blue(img.pixels[p]);
                    float gPx = gf[l + hw][k + hw]; // gaussian value.
                    
                    sum_r += px_r * gPx * exp( -(px_r0 - px_r)*(px_r0 - px_r) / 2. / s / s );
                    sum_g += px_g * gPx * exp( -(px_g0 - px_g)*(px_g0 - px_g) / 2. / s / s );
                    sum_b += px_b * gPx * exp( -(px_b0 - px_b)*(px_b0 - px_b) / 2. / s / s );
                    sum_below_r += gPx * exp( -(px_r0 - px_r)*(px_r0 - px_r) / 2. / s / s );
                    sum_below_g += gPx * exp( -(px_g0 - px_g)*(px_g0 - px_g) / 2. / s / s );
                    sum_below_b += gPx * exp( -(px_b0 - px_b)*(px_b0 - px_b) / 2. / s / s );
                }
            } // iteration of peripheral px.
            filteredImg.pixels[j * img.width + i] = color(sum_r / sum_below_r, sum_g / sum_below_g, sum_b / sum_below_b);
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
