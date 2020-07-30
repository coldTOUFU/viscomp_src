String imagePath = "lena.jpg";
int maxR = 10; // max diameter of ellipses.

PImage img;
float[] diffH, diffV;

float [][] prewittH = {{-1, 0, 1}, {-1, 0, 1}, {-1, 0, 1}}; // horizontal direction.
float [][] prewittV = {{-1, -1, -1}, {0, 0, 0}, {1, 1, 1}}; // vertical direction.

void setup(){
    size(500, 500);
    background(255);
    smooth();
    noStroke();
    img = loadImage(imagePath);
    diffH = diffArray(img, prewittH); // horizontal differential.
    diffV = diffArray(img, prewittV); // vertical differential.;
}

void draw() {    
    int x = (int)random(img.width - 1), y = (int)random(img.height - 1);
    int current = y*img.width + x;
    float angle = atan( diffV[current] / diffH[current] );
    float grad = // standarized grad in [0, maxR].
        sqrt( diffH[current]*diffH[current] + diffV[current]*diffV[current] ) * maxR / 255;
    
    pushMatrix(); //<>//
        translate(x, y);
        rotate(angle);
        fill(img.get(x, y));
        ellipse(0, 0, grad*sin(angle), grad*cos(angle));
    popMatrix();
}

// array of differential. elements are in [0, 255].
float[] diffArray(PImage img, float f[][]) {
    float[] diff = new float[img.width * img.height]; // array for save differentials.
    float[] arrayToReturn = new float[img.width * img.height];
    
    float min = 1000, max = -1000;
    for(int j = 1; j < img.height - 1; j++) { // scan image.
        for(int i = 1; i < img.width - 1; i++) {
            float sum = .0;
            for(int l = -1; l <= 1; l++) { //filtering process.
                for(int k = -1; k <= 1; k++) {
                    sum += f[l + 1][k + 1] * color(img.pixels[(j + 1) * img.width + i + k]);
                }
            }
            if(sum < min)      { min = sum; }
            else if(sum > max) { max = sum; }
            diff[j * img.width + i] = sum;
        }
    }
    float max_v = max > abs(min) ? max : abs(min);
    for(int p = 0; p < img.width * img.height; p++) { // save standarized differential in arrayToReturn.
        arrayToReturn[p] = 255 * (1 - abs(diff[p] / max_v));
    }
    
    return arrayToReturn;
}
