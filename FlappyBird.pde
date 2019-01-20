/**
 * Flappy Bird
 * By: Josh Blatt
 * June 12th, 2017
 **/

//Main Class, contains global information and all objects are declared here
int gameState = 0;//Governs what scene will be displayed
double gameSpeed = 1.5;//Governs the speed that the pillars approach the bird at
int spaceBetweenPillars = 550;//Governs the space between groups pillars
int score = 0;//The user's score
int highScore = 0;//The user's high score
boolean gainPoint = true;//Determines if the user can gain a point
boolean restart = false;//Used to restart the game
boolean inverseGame = false;//Boolean used to change the birds jump when the inverse game mode is being played

float birdX, birdY;//Floats for the bird's X and Y positions
int birdW = 35;//Float for the bird's width
int birdH = 35;//Float for the bird's height
float birdJump = 6;//Float for how high the bird jumps (is changed in difficulty select)

float pillarX[][] = new float [2][2];//[Type][Number] For the pillar's X values
float pillarY[][] = new float [2][2];//[Type][Number] For the pillar'x Y values

int pillarW = 50;//Pillar width
int pillarH = 400;//Pillar height

PImage backGround;//Import background image
PImage flappyBird;//Import bird image
PImage pillarTop;//Import top pillar image
PImage pillarBottom;//Import bottom pillar image

import processing.sound.*;//Import sound library
SoundFile buttonClick;//Declare button click sound
SoundFile avoidPillar;//Declare avoid pillar sound
SoundFile death;//Declare death sound
SoundFile jump;//Declare jump sound
void setup() 
{
  size(600, 600);

  backGround = loadImage("backGround.png");//Load background image
  flappyBird = loadImage("flappyBird.png");//Load bird image
  flappyBird.resize(birdW, birdH);//Resize bird image

  pillarTop = loadImage("pillarTop.png");//Load top pillar image
  pillarTop.resize(pillarW, pillarH);//Resize top pillar image
  pillarBottom = loadImage("pillarBottom.png");//Load bottom pillar image
  pillarBottom.resize(pillarW, pillarH);//Resize bottom pillar image

  buttonClick = new SoundFile(this, "buttonClick.mp3");//Load button click sound
  avoidPillar = new SoundFile(this, "avoidPillar.wav");//Load avoid pillar sound
  death = new SoundFile(this, "death.mp3");//Load death sound
  jump = new SoundFile(this, "jump.wav");//Load jump sound


  frameRate(60);//Set frame rate to 60 frames per second
}

Bird bird = new Bird (300, 400, birdW, birdH, 0.0, 0.4);//Declare bird object

TopPillar topPillar1 = new TopPillar (650, pillarY[0][0], 50, 0);//Declare first top pillar object
BottomPillar bottomPillar1 = new BottomPillar(650, pillarY[1][0] + spaceBetweenPillars, 50, 0);//Declare first bottom pillar object

TopPillar topPillar2 = new TopPillar (1000, pillarY[0][1], 50, 1);//Declare second top pillar object
BottomPillar bottomPillar2 = new BottomPillar(1000, pillarY[1][1] + spaceBetweenPillars, 50, 1);//Declare second bottom pillar object

Button play = new Button (150, 275, 300, 50, "Play", 1);//Declare play button object
Button instructions = new Button (150, 335, 300, 50, "Instructions", 4);//Declare instructions button object
Button retry = new Button (150, 450, 300, 50, "Retry", 2);//Declare retry button object
Button difficultySelect = new Button(150, 390, 300, 50, "Difficulty Select", 1);//Declare difficutly select button object
Button mainMenu = new Button (150, 330, 300, 50, "Main Menu", 0);//Declare main menu button object
Button back = new Button (150, 405, 300, 50, "Back", 0);//Declare back button object

Button inverse = new Button(150, 155, 300, 50, "Inverse", 2);//Declare inverse button object (used to play the inverse game mode)
Button easy = new Button (150, 215, 300, 50, "Easy", 2);//Declare easy button object
Button medium = new Button (150, 275, 300, 50, "Medium", 2);//Declare medium button object
Button hard = new Button (150, 335, 300, 50, "Hard", 2);//Declare hard button object



void draw()
{
  image(backGround, 0, 0);//Display first background image
  image(backGround, 400, 0);//Display second background image (to cover the whole screen without stretching it)

  runGame(gameState);//Run game (display the current scene)
}