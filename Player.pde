class Player {
  int xpos;

  float ypos;

  PImage cat = loadImage("angery cat.png");

  int lives = 3;

  Player(int screen_y) {
    xpos = SIZE_X / 2;
    ypos = screen_y;
  }

  void move(int x) {
    if (x > SIZE_X - PADDLE_WIDTH) {
      xpos = SIZE_X - PADDLE_WIDTH;
    } else {
      xpos = x;
    }
  }

  void decreaseLives() {
    lives--;
  }

  void draw(int textX, int textY, color colour) {
    cat.resize(61, 68);
    image(cat, xpos, ypos);
    fill(colour);
    PFont myFont = loadFont("DialogInput.bold-48.vlw");
    textFont(myFont);
    text(lives, textX, textY);
  }
}
