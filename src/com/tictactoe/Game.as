package com.tictactoe 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	 import flash.events.MouseEvent;
	 import flash.system.System;
	
	/**
	 * ...
	 * @author naveen bollimpalli
	 */
	public class Game extends Sprite
	{
		[Embed(source = "game_page_items/replay.png")]
		private var ResetClass:Class;
		var reset_image:Bitmap = new ResetClass();
		var reset_sprite_image:Sprite = new Sprite();
		
		[Embed(source = "game_page_items/bg_tic.png")]
		private var BgClass:Class;
		var bg_image:Bitmap = new BgClass();
		var bg_sprite_image:Sprite = new Sprite();
		
		[Embed(source="game_page_items/back.png")]
		private var BackClass:Class;
		var back_image:Bitmap = new BackClass();
		var back_sprite_image:Sprite = new Sprite();
		
		var board:Board;
		var board_manager:BoardManager;
		static var player_turn = 0;
		
		public function Game() 
		{
			bg_sprite_image.addChild(bg_image);
			bg_sprite_image.x = 230;
			bg_sprite_image.y = 0;
			bg_sprite_image.width = 300;
			bg_sprite_image.height = 450;
			addChild(bg_sprite_image);
			
			reset_sprite_image.addChild(reset_image);
			reset_sprite_image.x = 445;
			reset_sprite_image.y = 10;
			
			back_sprite_image.addChild(back_image);
			back_sprite_image.x = 250;
			back_sprite_image.y = 10;
			reset_sprite_image.addEventListener(MouseEvent.CLICK, resetGame);
			back_sprite_image.addEventListener(MouseEvent.CLICK, goBackToHome);
			
			addChild(reset_sprite_image);
			addChild(back_sprite_image);
			
			board = new Board();
			board_manager = new BoardManager(board);
			
		}
		
		public function start():void
		{
			
			//use board manager to display game board
			addChild(board_manager);
			board_manager.startAndManageGameBoard();
			
			
		}
		
		public function goBackToHome(e:MouseEvent):void
		{
			removeChild(board_manager);
			board = new Board();
			board_manager = new BoardManager(board);
			parent.removeChild(this);
		}
		
		public function resetGame(e:MouseEvent):void
		{
			removeChild(board_manager);
			board = new Board();
			board_manager = new BoardManager(board);
			addChild(board_manager);
			board_manager.startAndManageGameBoard();
		}
		
		
		
		
		
	}

}