int n = 5, m = 6;
float a = 1, b = 1;
float sigma = 0;
float xFunc(float t) { return a*(cos(n*t)); }
float yFunc(float t) { return b*(cos(m*t + sigma)); }
