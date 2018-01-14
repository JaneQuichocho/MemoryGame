class Button {
  float x;
  float y;
  int bWidth;
  int bHeight;
  File audioFile;
  String name;
  PImage image;
  boolean showName = false;
  
  Button(float x, float y, int bWidth, int bHeight) {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
  }
  
  boolean isMouseOverButton() {
    return (mouseX > x && mouseX < x + bWidth && mouseY > y && mouseY < y + bHeight);
  }
  
  void setName(String name) {
    this.name = name;
  }
  
  void setImage(PImage image) {
    this.image = image;
  }
  
  void drawSelf() {
    fill(211);
    rect(x, y, bWidth, bHeight, 10);
    if (name != null && showName == true) {
      fill(0);
      textAlign(CENTER);
      textSize(30);
      text(name, x + (bWidth / 2), y + (bHeight / 2)); 
    }
    if (this.image != null) {
      image.resize(bWidth, bHeight);
      image(this.image, x, y);
    }
  }
  
  void showName() {
    showName = true;
    drawSelf();
  }
  
  void hideName() {
    showName = false;
    drawSelf();
  }
  
  void setAudio(File audioFile) {
    this.audioFile = audioFile;
  }
}