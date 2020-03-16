// Alan Mo 1A

class Platform {
  // instance variables
  float x, y, w, h, lineX, lineY;
  color c;

  // constructor
  Platform() {
    x = width/2;
    y = height/2;
    lineX = x+60;
    lineY = y;
    c = color(200);
    w = 100;
    h = 15;
  }// end of constructor

  //display method
  void display() {
    fill(c);
    stroke(0);
    strokeWeight(2);

    //platform
    rect(x-50, y+10, w, h, 10);

    //head
    ellipse(x, y-70, 26, 30);

    //body
    line(x, y -55, x, y-20);

    //leftleg
    line(x, y-20, x-15, y+10);
    //rightleg
    line(x, y-20, x+15, y+10);

    //arms
    line(x-20, y-40, x+20, y-35);

    //pole
    line(x+10, y-15, x + 60, y - 90);

    //reel
    ellipse(x+25, y-30, 7, 9);

    //fishingline
    strokeWeight(0.5);
    stroke(150);
    line(x+60, y-90, lineX, lineY);
  }// end of display method

  void keyPressed() {  // if keys are pressed
    if ((keyCode=='w' || keyCode=='W' || keyCode==UP)) {
      if (lineY >= height/1.5) { //in water?
        lineY -= 1.5;

        if (y<0) { // platform above the top of the screen
          y = y + 1.5;
        }

        if (lineY<0) { // line above the top of the screen
          lineY = lineY + 1.5;
        }
      } else { //up out of water?
        lineY -= 3.5;

        if (y<0) { // platform above the top of the screen
          y = y + 3.5;
        }

        if (lineY<0) { // line above the top of the screen
          lineY = lineY + 3.5;
        }
      }
    }// end of UP

    if ((keyCode=='s' || keyCode=='S' || keyCode==DOWN)) {
      if (lineY >= height/1.5) { //in water?
        lineY += 1.5;
        if (y > height) { // platform below the bottom of the screen
          y = y - 1.5;
        } 

        if (lineY > height) { // line below the bottom of the screen
          lineY = lineY - 1.5;
        }
      } else { //up out of water?
        lineY += 3.5;
        if (y > height) { // platform below the bottom of the screen
          y = y - 3.5;
        } 

        if (lineY > height) { // line below the bottom of the screen
          lineY = lineY - 3.5;
        }
      }
    }// end of DOWN

    if ((keyCode=='a' || keyCode=='A' || keyCode==LEFT)) {
      x -= 2;
      lineX -=2;

      if (lineX < 0) { // platform off the left side of the screen
        x = x + 2;
      }

      if (lineX < 0) { // line off the left side of the screen
        lineX = lineX + 2;
      }
    }// end of EFT

    if ((keyCode=='d' || keyCode=='D' || keyCode==RIGHT)) {
      x += 2;
      lineX += 2;
      if (lineX > width) { // platform off the right side of the screen
        x = x - 2;
      } 

      if (lineX > width) { // line off the right side of the screen
        lineX = lineX - 2;
      }
    }// end of RIGHT
  }// end of keyPressed method
}// end of class
