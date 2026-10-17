Car[] cars = new Car[100];
boolean followMouse = false;

void setup(){
  size(400,400);
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car((int)random(width), (int)random(height), (int)random(255));
  }
}

void draw(){
  background(255);
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].show();
  }
}

void mousePressed(){
  followMouse = !followMouse;
}

class Car{
  int myX, myY, myC;

  Car(int x, int y, int c){
    myX = x;
    myY = y;
    myC = c;
  }

  void show(){
    noStroke();
    fill(myC);
    rect(myX, myY, 20, 10);
  }

  void move(){
    int xSpeed = (int)random(-2,3);
    int ySpeed = (int)random(-2,3);

    if (followMouse) {
      if (mouseX > myX)
        xSpeed = xSpeed + 1;
      else if (mouseX < myX)
        xSpeed = xSpeed - 1;

      if (mouseY > myY)
        ySpeed = ySpeed + 1;
      else if (mouseY < myY)
        ySpeed = ySpeed - 1;
    }
    else {
      if (mouseX > myX)
        xSpeed = xSpeed - 1;
      else if (mouseX < myX)
        xSpeed = xSpeed + 1;

      if (mouseY > myY)
        ySpeed = ySpeed - 1;
      else if (mouseY < myY)
        ySpeed = ySpeed + 1;
    }

    myX = myX + xSpeed;
    myY = myY + ySpeed;

    if (myX > width)
      myX = 0;
    if (myX < 0)
      myX = width;
    if (myY > height)
      myY = 0;
    if (myY < 0)
      myY = height;
  }
}
