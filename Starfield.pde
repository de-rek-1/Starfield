Particle[] particles = new Particle[120];
void setup() {
  size(600, 600);
  for (int i = 0; i < particles.length; i++) {
    if (i == 0) {
      particles[i] = new OddballParticle();
    } else {
      particles[i] = new Particle();
    }
  }
}
void draw() {
  background(0);
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}
class Particle {
  float x, y, dx, dy, speed;
  color c;
  Particle() {
    x = width / 2;
    y = height / 2;
    dx = (float)(Math.random() * 2 - 1);
    dy = (float)(Math.random() * 2 - 1);
    speed = (float)(Math.random() * 3 + 1);
    c = color((float)(Math.random() * 155 + 100), (float)(Math.random() * 155 + 100), (float)(Math.random() * 255));
  }
  void move() {
    x += dx * speed;
    y += dy * speed;
    if (x < 0 || x > width || y < 0 || y > height) {
      x = width / 2;
      y = height / 2;
      dx = (float)(Math.random() * 2 - 1);
      dy = (float)(Math.random() * 2 - 1);
      speed = (float)(Math.random() * 3 + 1);
    }
  }
  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, 6, 6);
  }
}
class OddballParticle extends Particle {
  float r = 10;
  float sizeChange = 0.5;  
  OddballParticle() {
    x = width / 2;
    y = height / 2;
    dx = (float)(Math.random() * 2 - 1);
    dy = (float)(Math.random() * 2 - 1);
    speed = 3;
    c = color(255, 255, 0);
  }
  void move() {
    x += dx * speed * 1.8;
    y += dy * speed * 1.8;
    if (Math.random() < 0.05) {
      dx = (float)(Math.random() * 2 - 1);
      dy = (float)(Math.random() * 2 - 1);
    }
    if (x < 0 || x > width || y < 0 || y > height) {
      x = width / 2;
      y = height / 2;
    }
    r += sizeChange;
    if (r > 30 || r < 10)
    sizeChange *= -1;
  }
  void show() {
    stroke(255);
    fill(c);
    ellipse(x, y, r, r);
    fill(255);
    ellipse(x, y, r / 3, r / 3);
  }
}
