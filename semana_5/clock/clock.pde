void setup() {
  size(400, 200);
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
  background(0);
  fill(255);
  
  // Get the current hour, minute, and second
  int h = hour();
  int m = minute();
  int s = second();
  
  // Format the time as HH:MM:SS
  String timeString = nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2);
  
  // Display the time on the screen
  text(timeString, width / 2, height / 2);
}
