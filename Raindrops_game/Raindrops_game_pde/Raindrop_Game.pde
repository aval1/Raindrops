int score = 0;
Raindrop[] r = new Raindrop[1000];
Catcher c;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;

void setup() {
  size(500,700);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  c = new Catcher();
}

void draw() {
  println("score: " + score);
  background(0);
   currentTime = millis();           
  timeChange = currentTime - oldTime;  
  for (int i = 0; i < r.length; i++) {
    r[i].display();
    c.catchDrop(r[i]);
     if (timeChange >= 2000) {       
    oldTime = currentTime;  
    r[i].drop();
  }
  }
  c.display();
  c.update();
}

