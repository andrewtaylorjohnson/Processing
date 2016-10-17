class Title
{
  Shape titleShape = new Shape(new PVector(0, 0, 0), new PVector(0, 0, 0), 0, height / 2);
  String titleText = "Title Text";
  
  void update()
  {
    titleShape.update();
    
    textAlign(CENTER, CENTER);
    text(titleText, 0, 0);
  }
}