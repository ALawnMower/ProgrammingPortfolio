// Alan Mo 1A

import java.io.*;

class Score {
  // instance variables
  int level, highLevel;
  float score;
  boolean start, gameOver, exit;
  String fileName;

  Score() {  // constructor
    level = 1;
    score = 0;
    start = true;
    gameOver = false;
    exit = false;
    fileName = "score.txt";
    writeToFile();// writes the current level to the file when the program starts
  }// end of constructor

  void display() {// display method
    fill(0);
    strokeWeight(2);
    textSize(30);
    text("Level " + level, 25, 50);// prints score and level info to the user
    text("Highscore: Level " + highLevel, 25, 100);// prints highscore to the user
    text("You Caught " + nf(score, 0, 2) + " Pounds of Fish", 25, 150);
    text("You Need " + nf(level*50 - score, 0, 2) + " More Pounds to Level Up!!!", 25, 200);
    if (score >= level*50) {// if required number of pounds is caught
      score = 0;
      level ++;
      writeToFile();
    }
  }// end of display method

  void writeToFile() {// write to file
    try {
      File file =new File(dataPath(""), "/" + fileName);// create file

      if (!file.exists()) {// creates file if it doesn't exist
        file.createNewFile();
      }

      FileWriter fw = new FileWriter(file, true);//true = append
      BufferedWriter bw = new BufferedWriter(fw);
      PrintWriter pw = new PrintWriter(bw);

      pw.write(str(level) + "\n");// print the current level to the file
      pw.close();
    } 
    catch(IOException io) {// if there is an error writing to a file
      System.out.println("Exception ");
      io.printStackTrace();// prints the error message ot the console
    }
    int levels[] = int(loadStrings("score.txt"));// saves the data from the file to an array
    highLevel = max(levels);// saves the largest value from the array to a variable
  }// end of write to file

  void exitGame() {
    exit();// exits the app
  }
}// end of class
