//Class for the top pillar (contains information of how the top pillars move, how they are reset, what they look like, etc)
class TopPillar//Class for top pillars
{
  float x;//Float for the top pillar's x value
  float y;//Float for the top pillar's y value
  int size;//Integer for the top pillar's width
  int index;//Integer for the index of the pillar (where it is in the array)

  TopPillar (float x, float y, int size, int index)//Top pillar constructor (contains properties of the bottom pillar)
  {
    this.x = x;//Set x of this object to x
    this.y = y;//Set y of this object to y
    this.size = size;//Set the size (width) of the object to size
    this.index = index;//Set index of the object to index
  }

  void update () //Update method (to change the values of the parameters of the top pillar
  {
    if (restart)//If a restart is occuring
    {
      this.y = (int)(random(-300, 0));//Randomly choose a y value between -300 and 0
      birdY = 300;//Set the bird's y value to 300 (this is done here because of the nature of the restart function)
      if (this.index == 0)//If the index is 0
      {
        this.x = 650;//Set the pillar's x value to 650
        pillarX[0][0] = 650;//Set the pillar's global x value to 650 also
        pillarY[0][0] = this.y;//Set the pillar's global y value to the current y value
      }
      else//If the index is 1
      {
        this.x = 1000;//Set the pillar's x to 1000
        pillarX[0][1] = 1000;//Set the pillar's global x value to 1000
        pillarY[0][1] = this.y;//Set the pillar's global y value to the current y value
      }
      
    }
    
    if (collision(birdX, birdY, birdW, birdH, this.x, this.y, pillarW, pillarH))//If a collision is occuring
    {
      death.play();
      if (score >= highScore)//If score is higher than the highscore
      {
        highScore = score;//Set highscore to score
      }
      gameState = 3;//Set gameState to 3 (the death screen)
      //rect(200, 200, 200, 200);//For testing
    }
    
    if (birdX + birdW > this.x + this.size && gainPoint == true)//If the bird has passed through the pillars and it has the ability to gain a point (a boolean used to ensure the score doesn't increase every frame)
    {
      avoidPillar.play();//Play the avoid pillar sound
      score++;//Increase score
      gainPoint = false;//Set the gain point boolean to false (so it will not gain a point every frame this is true)
    }
    
    if (this.x + this.size < 0)//If the pillar is off the screen
    {
      this.x = width + this.size;//Set the x value to the width of the screen plus the width of the pillar (so it is off screen)
      this.y = (int)(random(-300, 0));//Choose a random y value between -300 and 0
      pillarX[0][this.index] = this.x;//Set the pillar's global x to the current x value
      pillarY[0][this.index] = this.y;//Set the pillar's glboal y value to its current y value
      gainPoint = true;//Reset the bird's ability to gain a point (since it has been reset)
    }
    this.x -= gameSpeed;//Move the pillar towards the bird at the speed of gameSpeed
    
    image(pillarTop, this.x, this.y);//Display the pillar
    //rect(this.x, this.y, this.size, pillarH); //Check hitbox
    
  }
}