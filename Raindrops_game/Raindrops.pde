PImage galaxy;
int count = 200;
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

//Created Array for Raindrop
Raindrop[] r = new Raindrop[count];


void setup() {
  //intializes varaibles
  galaxy = loadImage("galaxy.jpg");
  size(galaxy.width, galaxy.height);
  run = true;
  stop= true;
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
  //Start screen for game
  if (run==true) {
    background(0);
    fill (140, 100, 100);
    rect(a, b, w, h);
    text("Start", 100, 100);
    textSize(20);
  }

  //Screen for the game play
  if (run == false) {
    background(galaxy);
    text("score " + score, 0+ width/34, 20); //Displays score variable
    text("lives " + lives, 0+ width/1.1, 20);
    c.display();
    for (int i=0; i<index; i++) {
      r[i].display();
      r[i]. drop();
      c.catchDrop(r[i]);
    }
    c.update();

    //this block of code helps set the time interval in which each raindrop falls
    currentTime= millis();
    timeChange = currentTime - oldTime;  
    if (timeChange>=1000) {
      index++;
      oldTime = currentTime;
    }

    //sets the parameters in which the game is won
    if (score>10) {
      text("WINNER", 300, 300);
    }
//sets the parameters when the game is lost
    if (lives==0) {
      stop=false;
      score=0;
    }
    if (stop==false) {
      background(0);
      text("Now the earth is distroyed. Are you proud of yourself?", 100, 100);
      text("Luckily I am feeling generous and will let you try again.", 100, 120);
      text("Replay", 250, 240);
      rect(m, n, o, p);
    }
    if (timeChange>=1000) {
      index++;
      oldTime = currentTime;
    }
  }
}
//The buttons created to start and replay the game
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


