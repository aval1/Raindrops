class Raindrop {
  PVector loc, vel, acc;
  int d;
  color e;

  Raindrop() {
    d = 5;
    colorMode(HSB, 360, 100, 100);
    loc = new PVector(random(width), -d); 
    vel = new PVector(0, 1);
    acc = new PVector(0, .02);
    
    e= color(random(360), 100, 100);
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
    fill(e);
  }
  void drop() {
    vel.add(acc);
    loc.add(vel);
    noStroke();
  }
}
