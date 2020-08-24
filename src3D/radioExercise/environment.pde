void drawTerrain(PImage img) {
    pushMatrix();
            scale(TERR_X, TERR_Y, TERR_Z);
            beginShape(QUADS);
            texture(img);
            textureMode(NORMAL);
                vertex(-.5, .5, -.5, 0, 0); vertex(-.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, -.5, 1, 1); vertex(.5, .5, -.5, 1, 0);
                vertex(.5, .5, -.5, 0, 0); vertex(.5, -.5, -.5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(.5, .5, .5, 0, 0); vertex(.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, .5, 1, 1); vertex(-.5, .5, .5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(-.5, -.5, -.5, 1, 1); vertex(-.5, .5, -.5, 1, 0);
                vertex(-.5, .5, .5, 0, 0); vertex(-.5, .5, -.5, 0, 1);
                  vertex(.5, .5, -.5, 1, 1); vertex(.5, .5, .5, 1, 0);
                vertex(-.5, -.5, -.5, 0, 0); vertex(-.5, -.5, .5, 0, 1);
                  vertex(.5, -.5, .5, 1, 1); vertex(.5, -.5, -.5, 1, 0);
        endShape();
        popMatrix();
}
