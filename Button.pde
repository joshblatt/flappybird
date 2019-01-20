//Class for buttons (contains what the buttons do, their positions, what happens when clicked, etc)
class Button //Class for buttons
{
  int x;//Integer for the button's x
  int y;//Integer for the button's y
  int w;//Integer for the button's width
  int h;//Integer for the button's height
  String message;//String for the text on the button
  int link;//Integer for the link (what scene will be displayed when the button is clicked)
  
  
  Button (int x, int y, int w, int h, String message, int link)//Button constructor (contains properties of the button)
  {
    this.x = x;//Set x of this object to x
    this.y = y;//Set y of this object to y
    this.w = w;//Set w of this object to w
    this.h = h;//Set h of this object to h
    this.message = message;//Set the message (text) of this object to message
    this.link = link;//Set the link of this object to link
  }
  
  void update()//Update function (to change the values of the properties of the button)
  {
    fill(255, 204, 0);//Fill button with a yellow-orange colour
    textAlign(CENTER, CENTER);//Align text in the center
    textSize(24);//Set text size to 24
    rect(this.x, this.y, this.w, this.h, 7);//Draw the button rectangle
    fill(255);//Fill white
    text(this.message, this.x + this.w / 2 + 2, this.y + this.h / 2);//Draw white message displaced 2 pixels to the right (for a shine effect)
    fill(91, 58, 56);//Fill text with brown colour
    text(this.message, this.x + this.w / 2, this.y + this.h / 2);//Show message
    fill(0);
    
    if (mousePressed && mouseX >= this.x && mouseX <= this.x + this.w && mouseY >= this.y && mouseY <= this.y + this.h) //IF the mouse is pressed and is inside the button
    {
      buttonClick.play();//Play the button click sound
      mousePressed = false;//Set mousePressed to false (so it will only run this once for every click)
      if (this.message.equals ("Easy"))//If it is the easy button
      {
        birdJump = 5.5;//Set the bird's jump to 5.5
        inverseGame = false;
      }
      else if (this.message.equals("Medium"))//If the button is the medium button
      {
        birdJump = 6;//Set the bird's jump to 6 (so it will jump higher than in easy mode, making it harder to avoid pillars)
        inverseGame = false;
      }
      else if (this.message.equals("Hard"))//If the butotn is the hard button
      {
        birdJump = 6.5;//Set the bird's jump to 6.5 (so it will jump higher than the medium mode, making it harder to avoid pillars)
        inverseGame = false;
      }
      else if (this.message.equals("Retry") || this.message.equals("Play")  || this.message.equals("Difficulty Select"))//If the button is the retry, play, or difficulty select button
      {
        restart = true;//Restart the game (or start it, it does the same thing)
      }
      else if(this.message.equals("Inverse"))//If the user presses the inverse button
      {
        birdJump = -5.5;//Set the bird's jump to -5.5 (so it jumps down)
        inverseGame = true;//Set the inverse game boolean to true
      }
      gameState = this.link;//Set the current scene to link (which is the scene it should go to)
    }
  }
  
}