int count = 1000;
int score;
int index = 1; 
int oldTime = 0; 
int currentTime = 0;
int timeChange = 0;
  boolean run;
   int w;
  int h;
  int a;
  int b;
Catcher c;
Raindrop[] r = new Raindrop[count]; //Created Array for Raindrop


void setup() {
  run = true;
  size(500, 500);
  for (int i = 0; i < r.length; i++) {  
    r[i] = new Raindrop();
  }
  c = new Catcher();
   w=50;
    h=50;
    a=100;
    b=100;
}
void draw() {
  if (run==true) {
    background(0);
    fill (140, 100,100);
    rect(a, b, w, h);
  }
    if (run == false){
      background(0);
  text("score " + score, 0+ width/30, 20); //Displays score variable
  c.display();
  for (int i=0; i<index; i++) {
    r[i].display();
    r[i]. drop();
    c.catchDrop(r[i]);
  }
  c.update();
  currentTime= millis(); //this block of code helps set the time interval in which each raindrop falls
  timeChange = currentTime - oldTime;  
 
  if (timeChange>=2000) {
    index++;
    oldTime = currentTime;
  }
}
}

void mousePressed(){
  if(mouseX>a && mouseX<a+w && mouseY>b && mouseY<b+h) {  
  run = true;
  }
  if (mouseX>a && mouseX<a+w && mouseY>b && mouseY<b+h) {
    run = false;
  }
}



