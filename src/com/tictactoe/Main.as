package com.tictactoe
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author naveen bollimpalli
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var game:Game = new Game();
			var game_manager:GameManager = new GameManager(game);
			game_manager.startManagingGame();
			stage.addChild(game_manager);
		}
		
	}
	
}