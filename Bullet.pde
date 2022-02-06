class Bullet {

  int ypos = SIZE_Y - MARGIN - 110;

  int xpos;

  PImage worm = loadImage("wormOnAString.png");

  Bullet() {
    xpos = mouseX;
  }

  void move() {
    ypos -= 20;
  }

  void collide(Aliens aliens) {
    if (ypos > aliens.y && ypos + 51 < aliens.y + ALIEN_HEIGHT + WHITE_ALIEN_HEIGHT && xpos < aliens.x + ALIEN_WIDTH && xpos + 51 > aliens.x) {
      aliens.explode();
    }
  }

  void draw() {
    worm.resize(51, 51);
    image(worm, xpos, ypos);
    move();
  }
}
