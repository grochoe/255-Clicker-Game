/**
*Clicker Game
*DAGD 255 Programming 1
*Version by: Elizabeth Grocholski
*/
package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	/**
	  * This is the document-level class that runs our entire game.
	  */
	public class Game extends MovieClip {

		var score:int = 0;// keeps track of the player's score
		
		/** The constructor of the Game class. */
		public function Game() {
		
		/** Attempt at spawning the thing object/movie clip into the scene */	
		var thingy:CoolThing = new CoolThing;
		addChild(thingy);	
			
			
		resetButton.buttonMode = true;//set the cursor to hand when hovering over the resetButton object 
		gameOver.stop(); //sets gameover movie clip
		resetButton.stop(); //sets the resetButton Movie clip
		bg.stop();

	
		addEventListener(Event.ENTER_FRAME, gameLoop);//enter gameLoop
		
		}//End Game
		
		/**
		 * This is our game loop. It is an event-handler function that
		 * runs on the ENTER_FRAME event.
		 * @param e The Event object that is triggering this event-handler.
		 */
		function gameLoop(e:Event):void {
			
			resetButton.addEventListener(MouseEvent.CLICK, resetClick); //checks for click on resetButton			

			thingy.update(); //update the thingy object
			
			if (thingy.x <= 0)
			{
				trace("hit");
				bg.gotoAndStop(2);
			}
			else if (thingy.x >= 800)
			{
				bg.gotoAndStop(3);
			}
			else 
			{
				bg.gotoAndStop(1);
			}
	
			/**
			*This updates the players score with the unscoredPoints from the coolThing class
			*/
				if(thingy.unscoredPoints > 0){
					score += thingy.unscoredPoints;
					thingy.unscoredPoints = 0;
				}//end if
				
				scoreboard.text = "SCORE: " + score;//displayes the updated score
				
				/** This changes the size of the thingy object shrinking it as the players score reaches landmark amounts*/
				if(score == 500 || score == 1000 || score == 1500 || score == 2000)
				{
					thingy.width -= .25;
					thingy.height -= .25;
				}
				else if (score == 0)
				{
					thingy.width = 100;
					thingy.height = 100;
				}// end if
				
				/**this checks to see if the game is over/ if the thingy object is off the bottom of the screen
				* It updates the screen and gives the player the option to restart			
				*/
				if(thingy.isOutOfBounds)
				{
					gameOver.gotoAndStop(2);
					resetButton.gotoAndStop(2);
				}//end if
				
				
			/**
			 * This is the resetClick Function. It is an event-handler function that
			 * runs on the CLICK event.
			 * The Event object is triggering this event-handler.
			 * It resets the game and allows the player to restart.
			 */
			function resetClick(Event:MouseEvent):void 
			{
					thingy.unscoredPoints = 0;
					resetButton.gotoAndStop(1);
					gameOver.gotoAndStop(1);
					thingy.isOutOfBounds = false;
					thingy.x = 10;
					thingy.y = 10;
					thingy.accelerationX = 0;
					thingy.accelerationY = .25;
					thingy.velocityY = 0;
					thingy.velocityY = 0;
					thingy.width = 50;
					thingy.height = 50;
					score = 0;
			}//end resetClick
			
		} // ends gameLoop
		
	} // ends Game class
	
} // end package
