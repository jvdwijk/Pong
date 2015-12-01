package screens 
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import utils.Controller;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class ModeScreen extends Screen 
	{
		private var title:TextField;
		private var choose:TextField;
		private var DW:TextField;
		
		public static const CHOOSE_GAME:String = "Choose Mode";	
		public static const START_GAME:String = "start game";
				
		
		public function ModeScreen():void {
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		
		private function init(e:Event):void 
		{
			
			trace("wertyuiop");
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
			choose.text = "Normal Mode = 1";
			choose.autoSize = TextFieldAutoSize.CENTER;
			choose.setTextFormat(subFormat)
			
			DW = new TextField();
			DW.embedFonts = true;
			DW.text = "Death Wish mode = 2";
			DW.autoSize = TextFieldAutoSize.CENTER;
			DW.setTextFormat(subFormat)
			
			choose.x = stage.stageWidth / 2 - choose.textWidth / 2;
			choose.y = stage.stageHeight / 2 + 20;
			
			DW.x = stage.stageWidth / 2 - choose.textWidth / 2;
			DW.y = stage.stageHeight / 2 + 40;
			
			choose.mouseEnabled = false;
			DW.mouseEnabled = false;
			
			addChild(choose);
			addChild(DW);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			trace(e.keyCode);
			if (e.keyCode == 50) {
			
				//choose.removeEventListener(Event.ENTER_FRAME, loop);		
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				dispatchEvent(new Event(START_GAME));
				
			}
		}
		
	}

}