int count = 100;
int score;
int index = 1; 
int oldTime = 0; 
int currentTime = 0;
int timeChange = 0;
boolean run;
boolean stop = true;
int w;
int h;
int a;
int b;
int m;
int n;
int o;
int p;
int lives;
Catcher c;
Raindrop[] r = new Raindrop[count]; //Created Array for Raindrop


void setup() {
  run = true;
  stop= true;
  size(500, 500);
  for (int i = 0; i < r.length; i++) {  
    r[i] = new Raindrop();
  }
  c = new Catcher();
  w=50;
  h=50;
  a=100;
  b=100;
  m= 250;
  n=250;
  o=100;
  p=100;
  lives=5;
}
void draw() {
  if (run==true) {
    background(0);
    fill (140, 100, 100);
    rect(a, b, w, h);
    text("Start", 100, 100);
    textSize(20);
  }
  if (run == false) {
    background(0);
    text("score " + score, 0+ width/30, 20); //Displays score variable
    text("lives " + lives, 0+ width/2, 200);
    c.display();
    for (int i=0; i<index; i++) {
      r[i].display();
      r[i]. drop();
      c.catchDrop(r[i]);
    }
    c.update();
    currentTime= millis(); //this block of code helps set the time interval in which each raindrop falls
    timeChange = currentTime - oldTime;  
   
    if (stop==false) {
      background(0);
      text("GAME OVER",250,250);
      rect(m,n,o,p);
    }
    if (lives==0) {
      stop=false;
    }
    if (timeChange>=2000) {
      index++;
      oldTime = currentTime;
    }
  }
}

void mousePressed() {
  
  if (mouseX>a && mouseX<a+w && mouseY>b && mouseY<b+h) {
    run = false;
  }
  if (mouseX>m && mouseX<m+o && mouseY>n && mouseY<n+p) {
   run = true;
   stop = true;
   lives = 5;
  }
}




