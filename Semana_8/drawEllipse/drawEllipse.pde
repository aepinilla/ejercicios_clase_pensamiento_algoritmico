float w = 100;
float posY = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  //           Inputs
  //           x     y    w   h
  draw_ellipse(200, posY, w, 50);
  
  if (posY > width) {
    posY = 0;
  }
  
  posY++;
  w++;
}

// Crear función
void draw_ellipse(float x, float y, float w, float h) {
  println(w);
  ellipse(x, y, w, h);
}
