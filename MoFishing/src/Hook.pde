// Alan Mo 1A

class Hook {
  // instance variables
  float x, y, w, h;
  color c;

  // constructor
  Hook() {
    x = width/2 + 60;
    y = height/2;
    c = color(255, 165, 0);
    w = 7;
    h = 9;
  }// end of constructor

  //display method
  void display() {
    fill(c);
    stroke(0);
    strokeWeight(0);
    ellipse(x, y, w, h);
  }// end of display method

  // if keys are pressed
  void keyPressed() {

    // collision detection
    if ((keyCode=='w' || keyCode=='W' || keyCode==UP)) {

      if (y >= height/1.5) { //  slow under water
        y -= 1.5;

        if (y<0) { // above the top of the screen
          y = y + 1.5;
        }
      } else { // fast above water
        y -= 3.5;

        if (y<0) { // above the top of the screen
          y = y + 3.5;
        }
      }
    }// end of UP

    if ((keyCode=='s' || keyCode=='S' || keyCode==DOWN)) {
      if (y >= height/1.5) { // slow under water
        y += 1.5;
        if (y > height) { //off the bottom of the screen
          y = y - 1.5;
        }
      } else { // fast above water
        y += 3.5;
        if (y > height) { //off the bottom of the screen
          y = y - 3.5;
        }
      }
    }// end of DOWN

    if ((keyCode=='a' || keyCode=='A' || keyCode==LEFT)) {
      x -= 2;

      if (x<0) { //off the left side of the screen
        x = x + 2;
      }
    }// end of LEFT

    if ((keyCode=='d' || keyCode=='D' || keyCode==RIGHT)) {
      x += 2;
      if (x > width) { //off the right side of the screen
        x = x - 2;
      }
    }// end of RIGHT
  }// end of keyPressed method
}// end of class
