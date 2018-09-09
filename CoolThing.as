package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class CoolThing extends MovieClip {
		
		/** The y-component of the acceleration pixels/tick/tick. */
		var accelerationY:Number = 0.25;
		
		/** The x-component of the acceleration pixels/tick/tick. */
		var accelerationX:Number = 0;
		
		/** The x-component of the velocity in pixels/tick. */
		var velocityX:Number = 0;
		
		/** The y-component of the velocity in pixels/tick. */
		var velocityY:Number = 0;
		
		/** Rotational velocity in degrees/tick. */
		var velocityR:Number = -1;
		
		/** checks if the thingy object left the bottom of the screen*/
		public var isOutOfBounds:Boolean = false;	
		
		/** holder var for points to be added in Game class*/
		public var unscoredPoints:int = 0;
	
		
		/**
		 * This is the function that holds the CoolThing objects 
		 * it listens for clicks on the thingy objects. 
		 */
		public function CoolThing() 
		{
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		/**
		 * This is the function that that updates the thingy object 
		 * it is called in the Game class.
		 */
		public function update():void {
			
			velocityX += accelerationX;
			velocityY += accelerationY;
			x += velocityX;
			y += velocityY;
			rotation += velocityR;
			
			//Check if thingy object is within bounds of playing area
			if(x < 0 || x > 800) velocityX *= -1;
			if(y > 600) isOutOfBounds = true;
		}//end update
		
		
		/**
		 * This function is called when the `thingy` is clicked. Neat.
		 * @param e The MouseEvent object that is triggering this event-handler.
		 */
		function handleClick(e:MouseEvent):void {
			velocityX = Math.random() * 20 - 10; // -10 to 10
			velocityY = -10;
			velocityR = Math.random() * 4 - 2; // -2 to 2
			unscoredPoints = 100;
			
			//sets random blib noises for thingy clicks
			var blipNumber:Number = Math.random() * 4; // 0 to 4 
			var blip01:SoundBlip01 = new SoundBlip01();
			var blip02:SoundBlip02 = new SoundBlip02();
			var blip03:SoundBlip03 = new SoundBlip03();
			var blip04:SoundBlip04 = new SoundBlip04();
			
			//plays random blib noises for thingy clicks
			if(blipNumber >= 0 && blipNumber < 1)
			{
				blip01.play();
			}
			else if(blipNumber >=1 && blipNumber <2)
			{
				blip02.play();
			}
			else if(blipNumber >= 2 && blipNumber <3)
			{
				blip03.play();
			}
			else
			{
				blip04.play();
			}
			
		}//End HandleClick
		
	}//End Public Class
	
}//End Package
