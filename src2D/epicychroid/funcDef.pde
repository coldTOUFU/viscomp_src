float a = 3; float b = 2; float c = 1;
float xFunc(float t) { return (a + b)*cos(t) - c*cos(a/b + 1)*t; }
float yFunc(float t) { return (a + b)*sin(t) - c*sin(a/b + 1)*t; }
