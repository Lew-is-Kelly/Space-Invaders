Aliens aliens[];
Player thePlayer;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

PImage back;

void setup() {
  size(1080, 720);
  back = loadImage("space.png");
  back.resize(SIZE_X, SIZE_Y);
  noStroke();
  frameRate(60);
  aliens = new Aliens[10];
  array_init(aliens);
  thePlayer = new Player(SIZE_Y - MARGIN - 60);
}

void draw() {
  background(back);
  array_move(aliens);
  array_draw(aliens);
  thePlayer.move(mouseX);
  thePlayer.draw(SIZE_Y - MARGIN, SIZE_X - MARGIN, 255);
  bullet_draw();
  for (int i = 0; i < aliens.length; i++) {
    for (int c = 0; c < bullets.size(); c++) {
      bullets.get(c).collide(aliens[i]);
    }
  }
}

void array_init(Aliens[] theArray) {
  int s = 0;
  for (int i = 0; i < theArray.length; i++) {
    theArray[i] = new Aliens(s + MARGIN + 30);
    s += ALIEN_WIDTH * 2;
  }
} 

void array_draw(Aliens[] aliens) {
  for (int i = 0; i < aliens.length; i++) {
    aliens[i].draw();
  }
}

void array_move(Aliens[] aliens) {
  for (int i = 0; i < aliens.length; i++) {
    aliens[i].move();
  }
}

void bullet_move() {
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).move();
  }
}

void bullet_draw() {
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).draw();
  }
}

void mousePressed() {
  bullets.add(new Bullet());
}
