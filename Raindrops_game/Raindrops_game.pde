class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  color c;
  int d;
  PImage comet;

  Raindrop() { 
    colorMode(HSB, 360, 100, 100);
    comet = loadImage("comet.png");
    loc = new PVector(random(500), 0);
    acc = new PVector (0, .01); 
    c = color(random(360), 100, 100);
    vel = new PVector(0, 2);
    d= 30;
  }

  void display() { //creates the raindrop
    fill(c);
    image(comet,loc.x, loc.y, d, d);
  }
  void drop() { //Makes the variable move with velocity and acceleration
    loc.add(vel);
    vel.add(acc);
    noStroke();
    if (loc.y>height) {
      lives-=1;
      loc.set(width*10,0);
      vel.set(0,0);
      acc.set(0,0);
    }
  }
}

