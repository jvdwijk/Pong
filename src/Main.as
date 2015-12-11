package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screens.*;
	import sounds.SoundPlayer;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class Main extends Sprite 
	{
		private var gameScreen:GameScreen;
		private var introScreen:IntroScreen;
		private var gameOverScreen:GameOverScreen;
		private var winScreen:WinScreen;
		private var soundPlayer:SoundPlayer;
		private var chooseScreen:ModeScreen;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point			
			soundPlayer = new SoundPlayer(this);
			buildIntroSreen();
		}
		private function buildIntroSreen():void
		{		
			
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.CHOOSE_GAME, chooseGame);
		}
		
		private function chooseGame(e:Event):void
		{
			removeChild(introScreen);
			chooseScreen = new ModeScreen();
			addChild(chooseScreen);
			chooseScreen.addEventListener(ModeScreen.START_GAME, startGame);
						
		}
		
		private function startGame(e:Event):void 
		{
			removeChild(chooseScreen);
			gameScreen = new GameScreen();
			addChild(gameScreen);
			
			
			gameScreen.addEventListener(GameScreen.GAME_OVER, onGameOver);
			gameScreen.addEventListener(GameScreen.WIN_SCREEN, onWin);
			
			
			
		}		
	
		private function onGameOver(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen.removeEventListener(GameScreen.GAME_OVER, onGameOver);
						
			gameOverScreen = new GameOverScreen();
			addChild(gameOverScreen);
			gameOverScreen.addEventListener(GameOverScreen.RESET, onReset);
			
			
		}		
		
		private function onWin(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen.removeEventListener(GameScreen.WIN_SCREEN, onWin);
			
						
			winScreen = new WinScreen();
			addChild(winScreen);
			winScreen.addEventListener(WinScreen.RESET2, onReset2);
			
			
		}	
		
		private function onReset(e:Event):void 
		{
			removeChild(gameOverScreen);
			gameOverScreen.removeEventListener(GameOverScreen.RESET, onReset);
			
			buildIntroSreen();
		}
		
		private function onReset2(e:Event):void 
		{
			removeChild(winScreen);
			winScreen.removeEventListener(WinScreen.RESET2, onReset2);
			
			buildIntroSreen();
		}
		
	}
	
}