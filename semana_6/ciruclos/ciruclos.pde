int x = 0;
int y = 0;

float level;
float rad;

void setup() {
  size(800, 800);
  background(255);
  frameRate(5);
}

void draw() {
  // Un valor provisional
  level = random(0, 1);
  // El tamaño de los círculos
  rad = (level * width / 3);

  for (int i = 0; i < 5; i++) {
    drawCircle();
  }

  if (y < height) {
    x += 50;
    if (x > width) {
      x = 0;
      y += 50;
    }
  } else {
    noLoop();
  }
}

void drawCircle() {
  float r = random(100, 255);
  float g = random(0, 255);
  float b = random(100, 255);
  
  fill(100, 10);
  stroke(r, g, b);
  ellipse(x, y, rad, rad);
}
