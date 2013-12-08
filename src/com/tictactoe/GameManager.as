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
	public class GameManager extends Sprite
	{
		var game:Game;
		//include 4 Sprite buttons here
		
		[Embed(source = "menu_buttons/start.png")]
		private var StartImageClass:Class;
		var start_image:Bitmap = new StartImageClass();
		var start_button:Sprite = new Sprite();
		
		
		[Embed(source = "menu_buttons/exit.png")]
		private var ExitClass:Class;
		var exit_image:Bitmap = new ExitClass();
		var exit_button:Sprite = new Sprite();
		
		[Embed(source = "game_page_items/bg_tic1.png")]
		private var BgClass:Class;
		var bg_image:Bitmap = new BgClass();
		var bg_sprite_image:Sprite = new Sprite();
		
		public function GameManager(g:Game) 
		{
			game = g;
			bg_sprite_image.addChild(bg_image);
			bg_sprite_image.x = 230;
			bg_sprite_image.y = 0;
			bg_sprite_image.width = 300;
			bg_sprite_image.height = 450;
			addChild(bg_sprite_image);
		}
		
		public function startManagingGame()
		{
			start_button.x = 290;
			start_button.y = 280;
			start_button.addChild(start_image);
			start_button.addEventListener(MouseEvent.CLICK, startGame);
			
		
			exit_button.x = 290;
			exit_button.y = 350;
			exit_button.addChild(exit_image);
			exit_button.addEventListener(MouseEvent.CLICK, exit);
			
			loadMenuList();
		}
		
		public function loadMenuList():void
		{
			addChild(start_button);
			addChild(exit_button);
			
		}
		
		public function unloadMenuList():void
		{
			removeChild(start_button);
			removeChild(exit_button);
		}
		
		private function startGame(e:MouseEvent):void
		{
			addChild(game);
			game.start();
			
		}
		
		
		private function exit(e:MouseEvent):void
		{		
			System.exit(0);
		}
		
		
		
	}

}