int count = 1000;
Catcher c;
Raindrop[] r = new Raindrop[count];


void setup() {
  size(500,500);
  for (int i = 0; i < count; i++) {  
  r[i] = new Raindrop();
  }
  c = new Catcher();
}
void draw() {
   background(0);
  c.display();
  for (int i=0; i<count; i++){
   r[i].display();
  }
}
