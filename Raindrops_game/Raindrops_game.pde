class Raindrop {

int count = 1000;
PVector[] locs = new PVector[count];
PVector[] vels = new PVector[count];
PVector[] acc = new PVector[count];
PVector[] neg = new PVector [count];
color[] c = new color[count];

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  for (int i = 0; i < count; i++) {
    locs[i] = new PVector(random(2.5,497.5), random(2.5,497.5));
    acc[i] = new PVector (0, .0001);
    neg[i] = new PVector (-1, -1);
    c[i] = color(random(360), 100, 100);
    vels[i] = new PVector(0,1);
  }
}

void draw() {
 background(0); 
  for (int i = 0; i < count; i++) {
    fill(c[i]);
    ellipse(locs[i].x, locs[i].y, 5, 5);
    locs[i].add(vels[i]);
    vels[i].add(acc[i]);
    noStroke();
    if (locs[i].y+2.5>height) {
      vels[i].y*=-1;
    }
    if (locs[i].x+2.5> width) {
      vels[i].x*=-1;
    }
    if (locs[i].x-2.5<0) {
      vels[i].x*=-1;
    }
  if (locs[i].y-2.5<0) {
      vels[i].y*=-0.5;
    }
}
}
}
