package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	import screens.GameScreen;
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var maxSpeed:Number;
		
		public function Destroy():void 
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function get MaxSpeed():Number 
		{
			
			return maxSpeed; 
		}
  
		public function set MaxSpeed(m:Number):void 
		{
			if (m > 30) 
			{
				trace("Maximale snelheid kan niet sneller dan 30 zijn!"); 
			}
			else
			{
				maxSpeed = m; 
			}
		}
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		private function loop(e:Event):void 
		{
			this.addEventListener(GameScreen.DESTROY, Destroy);
			if (controller.up)
			{
				speed = -15;
				if (this.y < 0)
				{
					this.y = stage.stageHeight;
				}
			}
			else if(controller.down)
			{
				speed = 15;
				if (this.y > stage.stageHeight)
				{
					this.y = 0;
				}
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
				
				
			}
			this.y += speed;
		}
		
	}

}