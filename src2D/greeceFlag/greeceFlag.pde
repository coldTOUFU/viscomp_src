size(270, 180);
background(#0039A6);

noStroke();

// stripe
fill(255);
for(int i = 0; i < 4; i++) { 
    rect(0, 20 + i*40, 270, 20); //<>//
}

// cross
fill(#0039A6);
rect(0, 0, 100, 100);

fill(255);
rect(40, 0, 20, 100);
rect(0, 40, 100, 20);
