class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  color c;
  int d;

  Raindrop() { 
    colorMode(HSB, 360, 100, 100);
    loc = new PVector(random(500),0);
    acc = new PVector (0, .01); 
    c = color(random(360), 100, 100);
    vel = new PVector(0, 2);
    d= 20;
}

  void display() { //creates the raindrop
    fill(c);
    ellipse(loc.x, loc.y, d,d);
  }
  void drop() { //Makes the variable move with velocity and acceleration
    loc.add(vel);
    vel.add(acc);
    noStroke();
  }
}

