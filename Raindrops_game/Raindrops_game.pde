class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  color c;
  int d;
  PImage comet;

  Raindrop() { 
    //This block of code sets the speed, location, and sixe of the comet
    colorMode(HSB, 360, 100, 100);
    comet = loadImage("comet.png");
    loc = new PVector(random(width), 0);
    acc = new PVector (0, 0); 
    c = color(random(360), 100, 100);
    vel = new PVector(0, 5);
    d= 30;
  }

  void display() { //creates the comet
    fill(c);
    image(comet, loc.x, loc.y, d, d);
  }
  //Makes the loc varaible move with velocity and acceleration
  void drop() {
    loc.add(vel);
    vel.add(acc);
    noStroke();
    if (loc.y>height) {
      score++;
      loc.set(width*10, 0);
      vel.set(0, 0);
      acc.set(0, 0);
    }
  }
}

