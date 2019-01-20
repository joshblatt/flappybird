//Method that returns whether or not a collision is occuring and if the game should end
boolean collision(float birdX, float birdY, int birdW, int birdH, float pillarX, float pillarY, int pillarW, int pillarH)//Function to check for collisions, the bird's and pillar's coordinates are used
{
  //Checks for collisoin by cheking to see if the bird and pillar are overlapping, and if the bird is hitting the ground (in normal mode) or if the bird is hitting the sky (in inverse mode)
  if ((birdX <= pillarX + pillarW && pillarX <= birdX + birdW && birdY <= pillarY + pillarH && pillarY <= birdY + birdH) || (birdY > height - birdH && inverseGame == false) || (birdY < 0 && inverseGame))//If the bird and pillar are colliding
  {
    return true;//Return true
  }
  return false;//Otherwise return false
}