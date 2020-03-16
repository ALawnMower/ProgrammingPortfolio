// Alan Mo 1A

class Shark extends Fish {
  // instance variables
  float x, y, wi, hi, sWeight, xSpeed, ySpeed;
  color sc;
  boolean caught, pressed;
  String name, url;
  int sType;

  // constructor
  Shark() {
    // random position
    x = random(0, width);
    y = random(height/1.5, height);

    //random shark size
    wi = random(90, 110);
    hi = random(40, 50);

    // random shark weight
    sWeight = wi + 70 + random(9.99);

    // random speed
    xSpeed = random(-1, 1);
    ySpeed = random(-0.5, 0.5);

    // random shark color
    sc = color(random(70, 150));

    caught = false;
    pressed = false;

    // random type
    sType = int(random(10));
    switch(sType) {
    case 0:
      name = "";
      url = "";
      break;
    case 1:
      name = 
        url = "";
      break;
    case 2:
      name = "Oceanic Whitetip Shark";
      url = "https://www.fisheries.noaa.gov/species/oceanic-whitetip-shark";
      break;
    case 3:
      name = "Pacific Shortfin Mako Shark";
      url = "https://www.fisheries.noaa.gov/species/pacific-shortfin-mako-shark";
      break;
    case 4:
      name = "Atlantic Sharpnose Shark";
      url = "https://www.fisheries.noaa.gov/species/atlantic-sharpnose-shark";
      break;
    case 5:
      name = "Scalloped Hammerhead Shark";
      url = "https://www.fisheries.noaa.gov/species/scalloped-hammerhead-shark";
      break;
    case 6:
      name = "Striped Smoothhound Shark";
      url = "https://www.fisheries.noaa.gov/species/striped-smoothhound-shark";
      break;
    case 7:
      name = "Atlantic Common Thresher Shark";
      url = "https://www.fisheries.noaa.gov/species/atlantic-common-thresher-shark";
      break;
    case 8:
      name = "Daggernose Shark";
      url = "https://www.fisheries.noaa.gov/species/daggernose-shark";
      break;
    case 9:
      name = "Smalltooth Sawfish";
      url = "https://www.fisheries.noaa.gov/species/smalltooth-sawfish";
      break;
    }
  }// end of constructor

  void display() {// display method
    stroke(sc);
    strokeWeight(1);

    // display shark
    fill(sc);
    ellipse(x, y, wi, hi);
    if (xSpeed > 0) {
      triangle(x-(wi/2)+(wi/4), y, x-(wi), y-(hi), x-(wi), y+(hi));
    } else {
      triangle(x+(wi/2)-(wi/4), y, x+(wi), y-(hi), x+(wi), y+(hi));
    }    
    fill(255);
    textAlign(LEFT);
    text(nf(sWeight, 0, 2), x - (wi/2)+4, y+7);

    if ((mouseX >= (x - (wi/2))) && (mouseX <= (x + (wi/2))) && (mouseY >= (y - (hi/2))) && (mouseY <= (y + (hi/2)))) {
      fill(0);
      textSize(60);
      textAlign(LEFT);
      text(name, width/2-480, height/3);
      textSize(30);
      text("(Click to see more info)", width/2-480, height/3+50);
      if (mousePressed && !pressed) {// if clicked
        link(url);
        pressed = true;
      }// end of if clicked
    }// end of if cursor is within button, change how button looks
  }// end of display method

  // movement method
  void move() {
    // shark collision detection

    if (dist(x, y, h.x, h.y) <= hi) {// if touching hook thengameOver
      s.gameOver = true;
    }

    x = x + xSpeed;
    if (x > width) {// off the right of the screen
      xSpeed = random(-1);
    } else if (x<0) {// off the left of the screen
      xSpeed = random(1);
    }

    y = y +ySpeed;
    if (y >= height) {// below the water
      ySpeed = random(-0.5);
    } else if (y<height/1.5) {// above the water
      ySpeed = random(0.5);
    }
    // end of shark collision detection
  }// end of move method
}// end of class
