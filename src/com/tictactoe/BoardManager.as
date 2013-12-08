package com.tictactoe 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	 import flash.events.Event;
	 import flash.events.MouseEvent;
	 import flash.system.System;
	/**
	 * ...
	 * @author naveen bollimpalli
	 */
	public class BoardManager extends Sprite
	{
		[Embed(source = "game_page_items/1_wins.png")]
		private var OneWinsClass:Class;
				
		[Embed(source = "game_page_items/2_wins.png")]
		private var TwoWinsClass:Class;
		
		[Embed(source="game_page_items/draw_match.png")]
		private var NoneWinsClass:Class;
		
		var board:Board;
		public function BoardManager(b:Board) 
		{
			board = b;
		}
		
		public function startAndManageGameBoard():void
		{
			addEventListener(ResultNotifier.RESULT, resultResolver);
			addChild(board);
			
		}
		
		
		function resultResolver(e:ResultNotifier):void
		{
			removeChild(board);
			var result:Bitmap;
			var result_sprite:Sprite = new Sprite;
			result_sprite.x = 280;
			result_sprite.y = 150;
			
			if (e.result == "one")
			{
				result = new OneWinsClass();
				result_sprite.addChild(result);
			}
			else if (e.result == "two")
			{
				result = new TwoWinsClass();
				result_sprite.addChild(result);
			}
			else
			{
				result = new NoneWinsClass();
				result_sprite.addChild(result);
			}
			addChild(result_sprite);
		}
		
		public function setBoard(b:Board)
		{
			removeChild(board);
			board = b;
			addChild(board);
		}
	}

}