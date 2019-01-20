//Bird class, contains information about bird (what it looks like, its jump, etc)
class Bird //Bird class
{
  float x;//Float for the bird's x
  float y;//Float for the bird's y
  int w;//Integer for the bird's width
  int h;//Integer for the bird's height
  float speed;//Float for the bird's speed (how fast it will fall for an instant)
  float gravity;//Float for bird's gravity (how fast it will accelerate down)


  Bird(float x, float y, int w, int h, float speed, float gravity)//Bird constructor (contains properties of the bird)
  {
    this.x = x;//Set x of this object to x
    this.y = y;//Set y of this object to y
    this.w = w;//Set w of this object to w
    this.h = h;//Set h of this object to h
    this.speed = speed;//Set speed of this object to speed
    this.gravity = gravity;//Set gravity of this object to gravity
  }

  void keyReleased()//FUnction to check to see when a key is released
  {
    if (inverseGame)//If it is the inverse game mode
    {
      if (keyCode == DOWN)//If the keycode is down
      {
        //jump.play();//Play the jump sound
        this.speed = -birdJump;//Make the bird fall
        keyCode = TAB;//Set keycode to something else (so it doesn't spam)
      }
    }
    else//If it is the normal game mode
    {
      if (keyCode == UP)//If the keycode is up
      {
        //jump.play();//Play the jump sound
        this.speed = -birdJump;//Make the bird fall
        keyCode = TAB;//Set the keycode to something else (so it doesn't spame)
      }
    }
  }
  void update()//Update function (changes the values of the properties of the bird and contains what the bird looks like)
  {
    if (restart)//If the restart button is pressed
    {
      this.y = 300;//Reset the bird's y value to 300
      this.speed = 0.0;//Reset the bird's speed to 0
      score = 0;//Rest the user's score to 0
      gainPoint = true;//Give the bird the ability to gain a point (if it didn't already have it)
      restart = false;//End the restart command
    }
    if (inverseGame)//If the inverse game mode is being played
    {
      this.y += speed;//Increase y by speed
      this.speed -= gravity;//Decrease speed by gravity
      if (this.y > height - this.h)//If the bird is at the bottom of the screen
      {
        this.y = height - this.h;//Don't allow it to go any lower
      }
    } 
    else//If the user is playing the normal game mode
    {
      this.y += this.speed;//Increase the bird's y value by speed
      this.speed += this.gravity;//Increase speed by gravity (add acceleration)
      if (this.y < 0)//If the bird is at the top of the screen
      {
        this.y = 0;//Don't allow it to go any higher
      }
    }

    //rect(this.x, this.y, this.w, this.h); //Used to check hitbox
    image(flappyBird, this.x, this.y);//Display the bird texture

    birdX = this.x;//Set the birdX global variable to the bird's current X position (for collision detection)
    birdY = this.y;//Set the birdY global variable to the bird's current Y position (for collision detection)
    birdW = this.w;//Set the birdW global variable to the bird's width (for collision detection)
    birdH = this.h;//Set the birdH global variable to the bird's height (for collision detection)
  }
}