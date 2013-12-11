color c = color(0);

void setup() {
  size(500,500);
}

void draw() {
  background(c);
  if (frameCount % 200== 0) {
    c = color(random (255), random (255), random (255));
  }
}
