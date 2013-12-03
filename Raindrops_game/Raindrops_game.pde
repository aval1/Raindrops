class Raindrop {
  PVector locs;
  PVector vels;
  PVector acc;
  PVector neg;
  color c;

  Raindrop() {
    colorMode(HSB, 360, 100, 100);
    locs = new PVector(random(2.5, 497.5), random(2.5, 497.5));
    acc = new PVector (0, .0001);
    neg = new PVector (-1, -1);
    c = color(random(360), 100, 100);
    vels = new PVector(0, 1);
  }

  void display() {
    fill(c);
    ellipse(locs.x, locs.y, 5, 5);
    locs.add(vels);
    vels.add(acc);
    noStroke();
    if (locs.y+2.5>height) {
      vels.y*=-1;
    }
    if (locs.x+2.5> width) {
      vels.x*=-1;
    }
    if (locs.x-2.5<0) {
      vels.x*=-1;
    }
    if (locs.y-2.5<0) {
      vels.y*=-0.5;
    }
  }
}

