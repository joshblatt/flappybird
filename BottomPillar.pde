//Bottom Pillar Class (contains information of how the bottom pillars move, how they are reset, what they look like, etc)
class BottomPillar //Class for bottom pillars
{
  float x;//Float x for the bird's current X position
  float y;//Float y for the bird's current Y position
  int size;//Integer size for the pillar's width
  int index;//Integer index (for the index of a particular pillar in an array of various x and y coordinates of different pillars)
  
  BottomPillar (float x, float y, int size, int index)//Bottom pillar constructor (contains properties of the bottom pillar)
  {
    this.x = x;//Set x of this object to x
    this.y = y;//Set y of this object to y
    this.size = size;//Set size (width) of this object to size
    this.index = index;//Set index of this object to index
  }
  
  void update () //Update function (to change the values of the properties of the bottom pillar)
  {
    if (restart)//If a restart is occuring
    {
      if (this.index == 0)//If this is the first index of the bottom pillar
      {
        this.x = 650;//Set its x values to 650 (so it is off the screen)
        this.y = pillarY[0][0] + spaceBetweenPillars;//Set its y value to the sum of the top pillar's y value and the amount of space between pillars (so it is constant)
      }
      else//If this is the second index of the bottom pillar
      {
        this.x = 1000;//Set its x value to 100 (so it is off the screen and behind the first pillar)
        this.y = pillarY[0][1] + spaceBetweenPillars;//Set its y value to the sum of hte top pillar's y value and the amount of space between pillars (so it is constant)
      }
    }
    if (collision(birdX, birdY, birdW, birdH, this.x, this.y, pillarW, pillarH))//If a collision is occuring
    {
      death.play();//Play death sound
      if (score >= highScore)//If the user's score is greater than the high score
      {
        highScore = score;//Set highscore to the user's score
      }
      gameState = 3;//Set the scene to the death screen
      //rect(200, 200, 200, 200);//Used in testing to make sure collisions are accurate by drawing a square instead of changing scenes
    }
    
    if (this.x + this.size < 0)//If the pillar is off the screen
    {
      this.x = width + this.size;//Set the pillar's x to the width of the screen + its height (to put a decent amount of space between pillars)
      this.y = pillarY[0][this.index] + spaceBetweenPillars;//Set the pillars y to its corresponding top pillar's y + the space between pillars
      pillarY[1][this.index] = this.y;//Set the bottom pillars y position to its current y position
    }
    this.x -= gameSpeed;//Move pillar towards the bird
    
    image(pillarBottom, this.x, this.y);//Display the bottom pillar image at its current x and y coordinates
    //rect(this.x, this.y, this.size, pillarH);//Check hitbox    
  }
}