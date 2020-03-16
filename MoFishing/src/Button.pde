// Alan Mo 1A

class Button {
  // instance variables
  float x, y, w, h;
  color c;
  String txt;
  boolean clicked;

  // constructor
  Button(int x, int y, int w, int h, color c, String txt) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.txt = txt;
    clicked = false;
  }// end of constructor

  // display method
  void display() {
    fill(c);
    rectMode(CENTER);    
    rect(x, y, w, h);
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text(txt, x, y+15);

    // if cursor is within button, change how button looks
    if ((mouseX >= (x - (w/2))) && (mouseX <= (x + (w/2))) && (mouseY >= (y - (h/2))) && (mouseY <= (y + (h/2)))) {// start game
      fill(c-20);// fill with different color
      rect(x, y, w, h);
      fill(255);
      text(txt, x+2, y+15+2);// display text over new rect

      if (mousePressed) {// if clicked
        clicked = true;
      }// end of if clicked
    }// end of if cursor is within button, change how button looks
  }// end of display method
}// end of class
