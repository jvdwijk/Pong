package actors 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class Paddle extends MovieClip 
	{
		
		public function Paddle() 
		{
			addChild(new Ipaddle());
		}
		
	}

}