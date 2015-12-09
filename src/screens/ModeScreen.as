package screens 
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import utils.Controller;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Joey vd Wijk
	 */
	
	public class ModeScreen extends Screen 
	{
		private var gameScreen:GameScreen;
		private var title:TextField;
		private var choose:TextField;
		private var DW:TextField;
		private var ultra:TextField;
		
		public static const CHOOSE_GAME:String = "Choose Mode";	
		public static const START_GAME:String = "start game";
		public static const DW_MODE:String = "Death Wish Mode";
		public static const ULTRA_MODE:String = "Ultra Mode";
				
		
		public function ModeScreen():void {
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
						
			title = new TextField();
			title.embedFonts = true;
			title.text = "Mode Menu";
			title.autoSize = TextFieldAutoSize.CENTER;			
			title.setTextFormat(textFormat);		
			
			title.x = stage.stageWidth / 2 - title.textWidth /2;
			title.y = stage.stageHeight / 2 - title.textHeight /2;
			
			title.mouseEnabled = false;
			
			addChild(title);
			
			
			
			choose = new TextField();
			choose.embedFonts = true;
			choose.text = "Normal Mode";
			choose.autoSize = TextFieldAutoSize.CENTER;
			choose.setTextFormat(subFormat);
			choose.addEventListener(MouseEvent.CLICK, Choose);
			
			DW = new TextField();
			DW.embedFonts = true;
			DW.text = "Death Wish mode";
			DW.autoSize = TextFieldAutoSize.CENTER;
			DW.setTextFormat(subFormat)
			DW.addEventListener(MouseEvent.CLICK, DeathWish);

			
			ultra = new TextField();
			ultra.embedFonts = true;
			ultra.text = "ultra mode";
			ultra.autoSize = TextFieldAutoSize.CENTER;
			ultra.setTextFormat(subFormat)
			ultra.addEventListener(MouseEvent.CLICK, ultraMode);
			
			choose.x = stage.stageWidth / 2 - choose.textWidth / 2;
			choose.y = stage.stageHeight / 2 + 20;
			
			DW.x = stage.stageWidth / 2 - choose.textWidth / 2;
			DW.y = stage.stageHeight / 2 + 45;
			
			ultra.x = stage.stageWidth / 2 - choose.textWidth / 2;
			ultra.y = stage.stageHeight / 2 + 70;
			
			//choose.mouseEnabled = false;
			//DW.mouseEnabled = false;
			//ultra.mouseEnabled = false;
			
			addChild(choose);
			addChild(DW);
			addChild(ultra);
			
		}
		
		private function Choose(e:MouseEvent):void 
		{
				//choose.removeEventListener(Event.ENTER_FRAME, loop);		
				stage.removeEventListener(MouseEvent.CLICK, Choose);
				GameScreen.mode = 1;
				dispatchEvent(new Event(START_GAME));
				
		}
		private function DeathWish(e:MouseEvent):void
		{
				//choose.removeEventListener(Event.ENTER_FRAME, loop);		
				stage.removeEventListener(MouseEvent.CLICK, DeathWish);
				GameScreen.mode = 2;
				dispatchEvent(new Event(START_GAME));
		}
		
		private function ultraMode(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.CLICK, ultraMode);
			GameScreen.mode = 3;
			dispatchEvent(new Event(START_GAME));
		}
		}
		
	}

