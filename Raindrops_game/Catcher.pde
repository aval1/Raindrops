class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d = 70;
  }

  void display() {
    ellipse(loc.x, loc.y, d, d); //Location of my ellipse
  }

  void update() {
    loc.set(mouseX, height-d);
  }
  void catchDrop(Raindrop drop) {       //catchDrop is the funtion  where the raindrop and the cather interact and the raindop disappears
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.vel.set(0, 0);
      drop.acc.set(0, 0);
      drop.loc.set(width*10,-300);
      score++;
    }
  }
}

