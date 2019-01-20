//Scene method (determines which scene will be displayed depending on the value of the input gameState
/*
Gamestate meaning
0 = main menu
 1 = difficulty select
 2 = game
 3 = death screen
 4 = instructions
*/
void runGame (int gameState)//Run game function that takes in gameState (to choose what to display);
{
  switch(gameState)//Switch case to choose the game scene to be displayed
  {
  case 0://If gameState is 0
    //Dispaly the main menu
    textAlign(CENTER, CENTER);
    textSize(48);
    text("Flappy Bird", 300, 175);//Display Flappy Bird text
    play.update();//Display the play button
    instructions.update();//Display the instructions button
    break;
  case 1://If gameState is 1
    //Display the difficulty select screen
    text("Choose your Difficulty", 300, 100);//Display choose your difficulty text
    text("Harder Difficulty -> Bird Jumps Higher", 300, 500);//Display what harder difficulties mean
    inverse.update();//Display inverse button
    easy.update();//Display easy button
    medium.update();//Display medium button
    hard.update();//Display hard button
    back.update();//Display back button
    break;
  case 2://If gameState is 2
    topPillar1.update();//Display the first top pillar
    bottomPillar1.update();//Display the first bottom pillar

    topPillar2.update();//Display the second top pillar
    bottomPillar2.update();//Display the second buttom pillar
    
    bird.keyReleased();
    bird.update();//Display the bird
    
    fill(0);//Fill black (for text)
    text("Score " + score, 300, 50);//Display score
    fill(255);//Fill white (to make sure the black doens't mess anything else up)
    break;
  case 3:
    //Death Screen
    fill(0);//Fill black
    text("High Score " + highScore, 300, 150);//Display highscore
    text("Score " + score, 300, 200);//Display score
    mainMenu.update();//Display main menu button
    difficultySelect.update();//Display difficulty select button
    retry.update();//Display retry button
    break;
  case 4:    
    //Instructions screen
    textAlign(CENTER, CENTER);//Align text in the center
    textSize(16);//Set the text size to 16
    //Display instructions
    text("You are a bird", 300, 50);
    text("You will fall", 300, 75);
    text("You can stop yourself from falling by flapping (press up key)", 300, 100);
    text("In inverse mode, you stop yourself from flying by falling (press down)", 300, 125);
    text("Avoid the ground and the incoming pillars", 300, 150);
    text("After sucessfully avoiding a pillar, you gain a point", 300, 175);
    text("Try to get the highest score possible", 300, 200);
    play.update();//Display play button
    break;
  default:
    //In case of an error
    background(255);//Display a white background
    break;
  }
}