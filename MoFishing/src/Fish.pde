// Alan Mo 1A

class Fish {
  // instance variables
  float x, y, wi, hi, fWeight, xSpeed, ySpeed;
  color c;
  boolean caught, pressed;
  String name, url;
  int fType;

  // constructor
  Fish() {

    // random position
    x = random(0, width);
    y = random(height/1.5, height);

    // random fish size
    wi = random(30, 50);
    hi = random(10, 30);

    // random fish weight
    fWeight = wi / random(7, 11) + random(0.99);

    // random speed
    xSpeed = random(-1, 1);
    ySpeed = random(-0.5, 0.5);

    // random fish color
    c = color(random(255), random(255), random(255));

    caught = false;
    pressed = false;

    // random type
    fType = int(random(10));
    switch(fType) {
    case 0:
      name = "Atlantic Salmon";
      url = "https://www.fisheries.noaa.gov/species/atlantic-salmon";
      break;
    case 1:
      name = "Mahi-Mahi (Dolfin Fish)";
      url = "https://www.fisheries.noaa.gov/species/pacific-mahimahi";
      break;
    case 2:
      name = "Pacific Albacore Tuna";
      url = "https://www.fisheries.noaa.gov/species/pacific-albacore-tuna";
      break;
    case 3:
      name = "Pacific Halibut";
      url = "https://www.fisheries.noaa.gov/species/pacific-halibut";
      break;
    case 4:
      name = "Nassau Grouper";
      url = "https://www.fisheries.noaa.gov/species/nassau-grouper";
      break;
    case 5:
      name = "Pacific Swordfish";
      url = "https://www.fisheries.noaa.gov/species/north-pacific-swordfish";
      break;
    case 6:
      name = "Gray Triggerfish";
      url = "https://www.fisheries.noaa.gov/species/gray-triggerfish";
      break;
    case 7:
      name = "Pacific Mackerel";
      url = "https://www.fisheries.noaa.gov/species/pacific-mackerel";
      break;
    case 8:
      name = "Vermilion Snapper";
      url = "https://www.fisheries.noaa.gov/species/vermilion-snapper";
      break;
    case 9:
      name = "Atlantic Pollock";
      url = "https://www.fisheries.noaa.gov/species/atlantic-pollock";
      break;
    }
  }// end of constructor

  void display() {// display method
    stroke(c);
    strokeWeight(1);
    fill(c);//display fish
    ellipse(x, y, wi, hi);

    if (xSpeed > 0) {// tail
      triangle(x-(wi/2)+(wi/4), y, x-(wi), y-(hi), x-(wi), y+(hi));
    } else {
      triangle(x+(wi/2)-(wi/4), y, x+(wi), y-(hi), x+(wi), y+(hi));
    }
    fill(255);
    text(nf(fWeight, 0, 2), x - (wi/2)+4, y+7);

    // if cursor is in fish
    if ((mouseX >= (x - (wi/2))) && (mouseX <= (x + (wi/2))) && (mouseY >= (y - (hi/2))) && (mouseY <= (y + (hi/2)))) {
      fill(0);
      textSize(60);
      textAlign(LEFT);
      text(name, width/2-480, height/3);
      textSize(30);
      text("(Click to see more info)", width/2-480, height/3+50);
      //text(info, width/2-480, height/3+100);
      if (mousePressed && !pressed) {// if pressed
        link(url);
        pressed = true;
      }
    }// end of if cursor is in fish
  }// end of display method


  void move() {// movement method/collision detection
    if (dist(x, y, h.x, h.y) <= hi) {// if touching hook then move to hook position
      x = h.x;
      y = h.y;
      if (dist(x, y, p.x, p.y) <= 61) {// add fish points if brought fish up to the platform
        caught = true;
        s.score += fWeight;
      }
    }

    // stays on hook position if caught
    if (x + wi == h.x && y + hi == h.y) {
      x = h.x;
      y = h.y;
    }

    x = x + xSpeed;// xspeed
    if (x > width) {// off the right of the screen
      xSpeed = random(-0.4);
    } else if (x<0) {// off the left of the screen
      xSpeed = random(0.4);
    }

    xSpeed += random(0.2);
    xSpeed -= random(0.2);

    y = y +ySpeed;// yspeed
    if (y >= height) {// below the water
      ySpeed = random(-0.05);
    } else if (y<height/1.5) {// above the water
      ySpeed = random(0.05);
    }

    ySpeed += random(0.002);
    ySpeed -= random(0.002);
  }// end of move method

  boolean isCaught() {
    if (caught) {
      return true;
    } else {
      return false;
    }
  }// end of isCaught
}// end of class
