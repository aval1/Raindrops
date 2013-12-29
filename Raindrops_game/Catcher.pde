class Catcher {
  PVector loc;
  int d;
  PImage earth;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    earth = loadImage("earth.png");
    d = 70;
  }

  //Location of the earth
  void display() {
    image(earth,loc.x, loc.y, d, d);
  }

// resets the catcher after catching the comet
  void update() {
    loc.set(mouseX, height-d);
  }
  //catchDrop is the funtion  where the comet and the earth interact and the comet disappears
  void catchDrop(Raindrop drop) {     
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.vel.set(0, 0);
      drop.acc.set(0, 0);
      drop.loc.set(width*10,-300);
      lives--;
    }
  }
}

