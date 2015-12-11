package actors 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class Muur extends MovieClip 
	{
		
		public function Muur() 
		{
			addChild(new MuurArt());
		}
		
	}

}