import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Memory Game
Minim[] minims = new Minim[15];
AudioPlayer[] audioPlayers = new AudioPlayer[15];

Button[] cards = new Button[12];
String[] wordBank = {"sack", "crack", "act", "stack", "rack", "pack", "fact", "mat", "rat", "fat", "hat",
    "sat", "hack", "brat", "shack"}; // size 15
    
int buttonX = 25;
int buttonY = 125;

boolean cardTurned = false;
int cardsTurned = 0;
int currentCard;
int currentIndex;
int lastCard;

boolean buttonHover = false;
    
void setup() {
  size(600, 700);
  background(255);
  noStroke();
  smooth();
  
  fill(0);
  textAlign(CENTER);
  textSize(35);
  text("Reading Memory Game", 300, 75);
  
  String[] usedWords = new String[6];
  
  for (int i = 0; i < 6; i++) {
    int wordIndex = round(random(14));
    usedWords[i] = wordBank[wordIndex];
    
    Button button = new Button(buttonX, buttonY, 150, 100);
    button.setName(wordBank[wordIndex]);
    button.drawSelf();
    cards[i] = button;
    buttonX = buttonX + 200;
    if (buttonX > 475) {
      buttonX = 25;
      buttonY = buttonY + 150;
    }
  }
  
  for (int i = 6; i < 12; i++) {
    int wordIndex = round(random(usedWords.length - 1));
    while (usedWords[wordIndex] == "") {
      wordIndex = round(random(usedWords.length - 1));
    }
    Button button = new Button(buttonX, buttonY, 150, 100);
    button.setName(usedWords[wordIndex]);
    button.drawSelf();
    
    usedWords[wordIndex] = "";
    
    cards[i] = button;
    buttonX = buttonX + 200;
    if (buttonX > 475) {
      buttonX = 25;
      buttonY = buttonY + 150;
    }
  }
  
}

void draw() {
  for (int i = 0; i < cards.length; i++) {
    if (cards[i].isMouseOverButton()) {
      fill(128);
      currentIndex = i;
    } else {
      fill(211);
    }
    cards[i].drawSelf();
  }
}

void mousePressed() {
  cards[currentIndex].showName();
  cardsTurned++;
  
  if (cardsTurned == 3) {
    cards[lastCard].hideName();
    cards[currentCard].hideName();
    cardsTurned = 1;
  } 
  
  if (cardTurned == false) {
    currentCard = currentIndex;
    cardTurned = true;
  } else {
    if (cards[currentCard].name != cards[currentIndex].name) {
      cardTurned = false;
      lastCard = currentIndex;
    } else {
      cardTurned = false;
      cardsTurned = 0;
    }
  }
  println(cardsTurned);
}