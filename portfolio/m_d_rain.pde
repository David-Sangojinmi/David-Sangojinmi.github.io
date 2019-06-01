// Main multi-directional rain script --------------------------
Droplet[] d = new Droplet[500];
Dropdown[] dDown = new Dropdown[500];
Dropleft[] dLeft = new Dropleft[500];
Dropright[] dRight = new Dropright[500];

boolean Left;
boolean Right;
boolean Up;

void setup() {
  size(800, 600);

  for (int i = 0; i < d.length; i++) {
    d[i] = new Droplet();
    dDown[i] = new Dropdown();
    dLeft[i] = new Dropleft();
    dRight[i] = new Dropright();
  }

}

void draw() {
  background(0);

  for (int i = 0; i < dDown.length; i++) {
    dDown[i].show();
    dDown[i].fall();
  }

  if (Up == true) {
    loop();
        for (int i = 0; i < d.length; i++) {
        d[i].show();
        d[i].fall();
      }
  } else if (Up == false) {
    for (int i = 0; i < d.length; i++) {
        d[i].hide();
      }
  }

  if (Right == true) {
    loop();
        for (int i = 0; i < dRight.length; i++) {
        dRight[i].show();
        dRight[i].fall();
      }
  } else if (Right == false) {
    for (int i = 0; i < dRight.length; i++) {
        dRight[i].hide();
      }
  }

  if (Left == true) {
    loop();
        for (int i = 0; i < dLeft.length; i++) {
        dLeft[i].show();
        dLeft[i].fall();
      }
  } else if (Left == false) {
    for (int i = 0; i < dLeft.length; i++) {
        dLeft[i].hide();
      }
  }

  if (keyPressed == true) {
    if (key == 'w') {
      Up = true;
    } else if (key == 'e') {
      Up = false;
    }

    if (key == 'a') {
      Left = true;
    } else if (key == 's') {
      Left = false;
    }

    if (key == 'd') {
      Right = true;
    } else if (key == 'f') {
      Right = false;
    }
  }
}

// Main droplet class --------------------------------------
class Droplet {
  float x = random(width);
  float y = random(600, 700);
  float z = random(0, 20);
  float h = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 1, 20);

  void fall() {
    y = y - yspeed;
    //yspeed = yspeed + 0.2;

    if (y < 0) {
      y = random(600, 700);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    noStroke();
    float opacity = map(z, 0, 20, 175, 255);
    fill(255, 74, 3, opacity);
    rect(x, y, 2, h);
  }

  void hide() {
    noStroke();
    noFill();
  }

}

// Rain dropping down class --------------------------------
class Dropdown {
  float x = random(width);
  float y = random(-500, -50);
  float z = random(0, 20);
  float h = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 20, 1, 20);

  void fall() {
    y = y + yspeed;
    //yspeed = yspeed + 0.2;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    noStroke();
    float opacity = map(z, 0, 20, 175, 255);
    fill(3, 74, 236, opacity);
    rect(x, y, 2, h);
  }

  void hide() {
    noStroke();
    noFill();
  }
}

// Rain dropping right class -------------------------------
class Dropright {
  float x = random(1300, 850);
  float y = random(height);
  float z = random(0, 20);
  float w = map(z, 0, 20, 10, 20);
  float xspeed = map(z, 0, 20, 1, 20);

  void fall() {
    x = x - xspeed;
    //yspeed = yspeed + 0.2;

    if (x < 0) {
      x = random(1300, 850);
      xspeed = map(z, 0, 20, 1, 20);
    }
  }

  void show() {
    noStroke();
    float opacity = map(z, 0, 20, 175, 255);
    fill(127, 127, 127, opacity);
    rect(x, y, w, 2);
  }

  void hide() {
    noStroke();
    noFill();
  }

}

// Rain dropping left class --------------------------------
class Dropleft {
  float x = random(-500, -50);
  float y = random(height);
  float z = random(0, 20);
  float w = map(z, 0, 20, 10, 20);
  float xspeed = map(z, 0, 20, 1, 20);

  void fall() {
    x = x + xspeed;
    //yspeed = yspeed + 0.2;

    if (x > width) {
      x = random(-500, -50);
      xspeed = map(z, 0, 20, 1, 20);
    }
  }

  void show() {
    noStroke();
    float opacity = map(z, 0, 20, 175, 255);
    fill(3, 236, 3, opacity);
    rect(x, y, w, 2);
  }

  void hide() {
    noStroke();
    noFill();
  }

}
// --------------------------------------------------------
