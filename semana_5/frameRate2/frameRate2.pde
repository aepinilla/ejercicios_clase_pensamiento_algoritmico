// Tomado de https://processing.org/reference/frameRate_.html

void setup() {
  frameRate(60);
}

int pos = 0;
void draw() {
  background(204);
  pos++;
  line(pos, 20, pos, 80);
  if (pos > width) {
    pos = 0;
  }
}
