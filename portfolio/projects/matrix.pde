Spot[] spots; // Declare array

void setup() {
  fullScreen();
  int numSpots = 200; // Number of objects
  int dia = width/numSpots; // Calculate diameter
  spots = new Spot[numSpots]; // Create array
  for (int i = 0; i < spots.length; i++) {
    float x = dia/2 + i*dia;
    float rate = random(0.8, 2);
    // Create each object
    spots[i] = new Spot(x, 5, dia, rate);
  }
  noStroke();
  colorMode(RGB);
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(0, 255, 0, random(1, 255));
  for (int i=0; i < spots.length; i++) {
    spots[i].move(); // Move each object
    spots[i].display(); // Display each object
  }
}

// Classes

class Spot {
  float x, y;         // X-coordinate, y-coordinate
  float diameter;     // Diameter of the circle
  float speed;        // Distance moved each frame
  int direction = 1;  // Direction of motion (1 is down, -1 is up)

  // Constructor
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }

  void move() {
    y += (speed * direction);
    if ((y > (height - diameter/2)) || (y < diameter/2)) {
      // direction *= -1;
      y = 5;
    }
  }

  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
