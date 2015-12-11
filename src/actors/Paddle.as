package actors 
{
	import flash.display.MovieClip;
	import screens.GameScreen;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class Paddle extends MovieClip 
	{
		//public var art:Paddle = new PaddleArt();
		public function Paddle() 
		{
			addChild(new PaddleArt());
			if(GameScreen.mode == 2){
			this.alpha = 0.1;
			}
			else if (GameScreen.mode == 5)
			{
				
			}
			else {
			this.alpha = 1;	
			}
		}
		
	}

}