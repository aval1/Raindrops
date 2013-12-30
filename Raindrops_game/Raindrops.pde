PImage galaxy;
int count = 300;
int score;
int index = 1; 
int oldTime = 0; 
int currentTime = 0;
int timeChange = 0;
int levels=0;
int interval=2000;
boolean run;
boolean stop = true;
boolean winner;
int w;
int h;
int a;
int b;
int m;
int n;
int o;
int p;
int wa;
int wb;
int ww;
int wh;
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
  winner= true;
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
  wa=250;
  wb=250;
  ww=100;
  wh=100;
  lives=10;
}

void draw() {
  //Start screen for game
  if (run==true) {
    background(0);
    fill (140, 100, 100);
    rect(a, b, w, h);
    text("Start", 100, 100);
    textSize(70);
    text("SAVE THE WORLD!", 30, 260);
    textSize(40);
    text("GAME OBJECTIVE:", 150, 380);
    text("Dodge the comets!", 150, 420);
    text("Protect the earth!", 150, 460);
    text("From the meteor shower!", 150, 500);
    textSize(20);
  }

  //Screen for the game play
  if (run == false) {
    background(galaxy);
    text("score " + score, 0+ width/34, 20); //Displays score variable
    text("lives " + lives, 0+ width/1.2, 20);
    text("Level " + levels, 0+width/2.2, height/2);
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
    if (timeChange>=interval) {
      index++;
      oldTime = currentTime;
    }
    if (score>10) {
      levels=1;
      if (timeChange>=1000) {
        index++;
        oldTime = currentTime;
      }
    }
    if (score>30) {
      levels=2;
      if (timeChange>=500) {

        index++;
        oldTime = currentTime;
      }
    }
    if (score>50) {
      levels=3;
      if (timeChange>=250) {
        index++;
        oldTime = currentTime;
      }
    }

    //sets the parameters in which the game is won   
    if (score>100) {
      winner=false;
    }
    if (winner==false) {
      background(0);
      textSize(40);
      text("WINNER", 200, 100);
      text("Want to Play Again?", 150, 200);
      rect(wa, wb, ww, wh);
    }
    //sets the parameters when the game is lost
    if (lives==0) {
      stop=false;
    }
    if (stop==false) {
      background(0);
      text("Now the earth is distroyed. Are you proud of yourself?", 100, 100);
      text("Luckily I am feeling generous and will let you continue", 100, 120);
      text("Replay", 250, 240);
      rect(m, n, o, p);
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
    lives = 10;
    interval=2000;
    score=0;
  }
  if (mouseX>wa && mouseX<wa+ww && mouseY>wb && mouseY<wb+wh) {
    run = true;
    stop = true;
    winner=true;
    lives = 10;
    interval=2000;
    score=0;
  }
}

