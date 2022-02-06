class Aliens {

  int x;

  float y = MARGIN;

  float ypos = MARGIN;

  int counter;

  boolean direction = true;

  boolean goingDown = false;

  boolean isExploded = false;

  PImage greenAlien = loadImage("alien1.png");

  PImage whiteAlien = loadImage("alien2.png");

  PImage explosionImage = loadImage("explosion.png");

  int movementSpeed = 1;

  float imageSelector;

  int explosionCounter = 0;

  Aliens (int startX) {
    x = startX;
    imageSelector = random(0, 2);
    greenAlien.resize(ALIEN_WIDTH, ALIEN_HEIGHT);
    whiteAlien.resize(ALIEN_WIDTH, WHITE_ALIEN_HEIGHT);
    explosionImage.resize(40, 40);
  }

  void move() {
    if (!isExploded) {
      if (direction && !goingDown) {
        x -= movementSpeed;
        y = (4 * sin((2 * PI) / (SIZE_X / 4) * x * 4)) + (ypos + ALIEN_HEIGHT / 2);
      } else if (!direction && !goingDown) {
        x += movementSpeed;
        y = (4 * sin((2 * PI) / (SIZE_X / 4) * x * 4)) + (ypos + ALIEN_HEIGHT / 2);
      }
      if (x < MARGIN && !goingDown) {
        direction = false;
        goingDown = true;
        movementSpeed += 1;
        counter = 0;
      }
      if (x > SIZE_X - ALIEN_WIDTH - MARGIN && !goingDown) {
        direction = true;
        goingDown = true;
        movementSpeed += 1;
        counter = 0;
      }
      if (goingDown) {
        y++;
        counter++;
        if (counter >= WHITE_ALIEN_HEIGHT) {
          goingDown = false;
          ypos += 45;
        }
      }
    }
  }

  void draw() {
    if (!isExploded) {
      if (imageSelector > 1) {
        image(greenAlien, x, y);
      } else {
        image(whiteAlien, x, y);
      }
    } else {
      if (explosionCounter < 60) {
        image(explosionImage, x, y);
        explosionCounter++;
      }
    }
  }

  void explode() {
    isExploded = true;
  }
}
