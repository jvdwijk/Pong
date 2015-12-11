package screens 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import utils.MovementCalculator;
	import screens.Scoreboard;
	import actors.*;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class GameScreen extends Screen
	{
		
		public var coop:Paddle = new AI();
		public var bal:Number = 2;
		public var paddle:Number = 2;
		public var punt:Number = 2;
		public var punt2:Number = 2;
		private var balls:Array = [];
		private var paddles:Array = [];
		private var scoreboard:Scoreboard;
		static public var mode:int = 0;
		
		static public const GAME_OVER:String = "game over";
		static public const DESTROY:String = "Destroy";
		static public const WIN_SCREEN:String = "win";
		static public const BALL_BOUNCE:String = "ballBounce";
		
		
		public function GameScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);			
		}				
		private function init(e:Event):void 
		{
			modeCheck();
			removeEventListener(Event.ADDED_TO_STAGE, init);
				for (var i:int = 0; i < bal; i ++) 
			{
				balls.push(new Ball());
				addChild(balls[i]);
				balls[i].reset();
				
				balls[i].addEventListener(Ball.OUTSIDE_RIGHT, onRightOut);
				balls[i].addEventListener(Ball.OUTSIDE_LEFT, onLeftOut);
				
			}	
			paddles.push(coop);
			paddles.push(new Player());
			paddles[0].balls = balls;
			
			for (i = 0; i <paddle ; i++) 
			{
				
				addChild(paddles[i]);
				paddles[i].y = stage.stageHeight / 2;
			}	
			paddles[0].x = stage.stageWidth - 100;
			
			paddles[1].x = 100;
			
			scoreboard = new Scoreboard();
			addChild(scoreboard);
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}		
		
		private function loop(e:Event):void 
		{
			checkCollision();
			
			
		}
		
		private function modeCheck():void
		{
			if (mode == 1) {
				bal = 2;
				paddle = 2;
				punt = 20;
				punt2 = 20;
				coop = new AI();
			}
			if (mode == 2) {
				bal = 2;
				paddle = 2;
				punt = 5;
				punt2 = 6;
				coop = new AI();
			}
			if (mode == 3) {
				bal = 1000;
				paddle = 2;
				punt = 5000;
				punt2 = 5000;
				coop = new AI();
			}
			if (mode == 4) {
				bal = 1;
				paddle = 2;
				punt = 10;
				punt2 = 10;
				coop = new AI();
				trace(GameScreen);
			}
			if (mode == 5) {
				bal = 1;
				paddle = 2;
				coop = new AI();
				punt2 = 3;
			}
		}
		
		private function checkCollision():void 
		{
			for (var i:int = 0; i < balls.length; i++) 
			{
				for (var j:int = 0; j < paddles.length; j++) 
				{
					if (paddles[j].hitTestObject(balls[i]))
					{
						balls[i].xMove *= -1;
						balls[i].x += balls[i].xMove / 2;
						
						dispatchEvent(new Event(BALL_BOUNCE));
					}
				}
			}
			
		}
		////DW_MODE
		//public function deathWish(e:Event):void
		//{
			//trace("DW");
			//bal = 20;
			//paddle = 1;
			//punt = 20;
		//}
		
		private function onLeftOut(e:Event):void 
		{
			var b:Ball = e.target as Ball;
			b.reset();
			
			scoreboard.player2 += 1;
			
			checkScore();
		}		
		private function onRightOut(e:Event):void 
		{
			var b:Ball = e.target as Ball;
			b.reset();
			scoreboard.player1 += 1;
			
			
			checkScore();
		}		
		
		private function checkScore():void 
		{
			
			if (scoreboard.player2 >= punt2)
			{
				destroy();
				dispatchEvent(new Event(DESTROY));
				dispatchEvent(new Event(GAME_OVER));
			}
			else if (scoreboard.player1 >= punt) {
				destroy();
				dispatchEvent(new Event(DESTROY));
				dispatchEvent(new Event(WIN_SCREEN));
			}
			
		}
			
		private function destroy():void
		{
			for (var i:int = 0; i < balls.length; i++) 
			{
				balls[i].destroy();
				removeChild(balls[i]);
			}
			balls.splice(0, balls.length);
			paddles[1].Destroy();
		}
	}

}