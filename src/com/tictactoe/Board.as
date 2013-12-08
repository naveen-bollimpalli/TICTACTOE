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
	public class Board extends Sprite
	{
		var lane_won:int = 10;
		var gameover = false;
		var player_won:int = 0;
		
		[Embed(source = "game_page_items/player1.png")]
		private var P1Class:Class;
	
		[Embed(source="game_page_items/player2.png")]
		private var P2Class:Class;
		
		[Embed(source="game_page_items/support.png")]
		private var GridClass:Class;
		var grid_images:Array = new Array(3); 
		var grid_sprite_images:Array = new Array(3);
		var grid_values:Array;
		
		
		
		[Embed(source = "game_page_items/player1_turn.png")]
		private var PlayerOneTurn:Class;
		var playerone_turn_image:Bitmap = new PlayerOneTurn();
		var playerone_turn_sprite_image:Sprite = new Sprite();
		
		[Embed(source = "game_page_items/player2_turn.png")]
		private var PlayerTwoTurn:Class;
		var playertwo_turn_image:Bitmap = new PlayerTwoTurn();
		var playertwo_turn_sprite_image:Sprite = new Sprite();
		
		var gamestat:int;
		
		public function Board() 
		{
			
			var i, j;
			var x:int = 250;
			var y:int = 70;
			grid_values = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
			grid_sprite_images = [[new Sprite(), new Sprite(), new Sprite()], [new Sprite(), new Sprite(), new Sprite()], [new Sprite(), new Sprite(), new Sprite()]];
			grid_images = [[new GridClass(),new GridClass(),new GridClass() ], [new GridClass(),new GridClass(),new GridClass() ], [new GridClass(),new GridClass(),new GridClass() ]];
			for (i = 0; i < 3; i++ )
			{	
				
				for (j = 0; j < 3; j++ )
				{
					(grid_sprite_images[i][j]).addChild(grid_images[i][j]);
					(grid_sprite_images[i][j]).x = x;
					(grid_sprite_images[i][j]).y = y;
					(grid_sprite_images[i][j]).height = 80;
					(grid_sprite_images[i][j]).width = 80;
					(grid_sprite_images[i][j]).addEventListener(MouseEvent.CLICK, updateAction);
					addChild(grid_sprite_images[i][j]);
					x = x + 90;
				}
				y = y + 90;
				x = 250;
			}
			
			playerone_turn_sprite_image.addChild(playerone_turn_image);
			playertwo_turn_sprite_image.addChild(playertwo_turn_image);
			playerone_turn_sprite_image.x = 290;
			playerone_turn_sprite_image.y = 350;
			
			playertwo_turn_sprite_image.x = 290;
			playertwo_turn_sprite_image.y = 350;
			
			addChild(playerone_turn_sprite_image);
			gamestat = 1;
		}
		public function shiftStatus()
		{
			if (gamestat == 1)
			{
				removeChild(playerone_turn_sprite_image);
				addChild(playertwo_turn_sprite_image);
				gamestat = 2;
				
			}
			else
			{
				removeChild(playertwo_turn_sprite_image);
				addChild(playerone_turn_sprite_image);
				gamestat = 1;
			}
		}
		
		
		public function updateAction(e:Event):void
		{
			var i = 0;
			var j = 0;
			for (i = 0; i < 3; i++ )
			{
				for (j = 0; j < 3; j++ )
				{
					if (e.target == grid_sprite_images[i][j])
					{
						grid_values[i][j] = gamestat;
						if (gamestat == 1)
						{
							
							(grid_sprite_images[i][j]).removeChild(grid_images[i][j]);
							grid_images[i][j] = new P1Class();
							(grid_sprite_images[i][j]).addChild(grid_images[i][j]);
							check_winning(1);
							
							if (gameover == false)
							{
								check_game_completion();
								//player1
								if (gameover == true)
								{
									parent.dispatchEvent(new ResultNotifier(ResultNotifier.RESULT,"none"));
								}
								
							}
							else
							{
								parent.dispatchEvent(new ResultNotifier(ResultNotifier.RESULT,"one"));
							}
						}
						else
						{
							(grid_sprite_images[i][j]).removeChild(grid_images[i][j]);
							grid_images[i][j] = new P2Class();
							(grid_sprite_images[i][j]).addChild(grid_images[i][j]);
							check_winning(2);
							
							if (gameover == false)
							{
								check_game_completion();
								//player1
								if (gameover == true)
								{
									parent.dispatchEvent(new ResultNotifier(ResultNotifier.RESULT,"none"));
								}
								
							}
							else
							{
								parent.dispatchEvent(new ResultNotifier(ResultNotifier.RESULT,"two"));
							}
						}
						shiftStatus();
					}
				}
			}
		}
		
		function check_winning(possib_winner:int):void
		{
		var row = false;
		var col = false;
		var diagonal_1 = false;
		var diagonal_2 = false;
		
		var i:int;
		for( i = 0 ; i < 3 ;++i)
		{
			
			
				if( grid_values[i][0] == grid_values[i][1] && grid_values[i][1] == grid_values[i][2] && grid_values[i][0] != 0 )
				{
					row = true;
					lane_won = i+1;
					break;
				}
				if( grid_values[0][i] == grid_values[1][i] && grid_values[1][i] == grid_values[2][i] && grid_values[0][i] != 0 )
				{
					lane_won = 4+i;
					col = true;
					break;
				}
				
						
		}
		
		if(grid_values[0][0] == grid_values[1][1] && grid_values[1][1] == grid_values[2][2] && grid_values[0][0] != 0 )
		{
			diagonal_1 = true;
			lane_won = 7;
			
		}
		if(grid_values[0][2] == grid_values[1][1] && grid_values[1][1] == grid_values[2][0] && grid_values[0][2] != 0 )
		{
			diagonal_2 = true;
			lane_won = 8;
			}
		
		if(row == true || col == true  || diagonal_1 == true || diagonal_2 == true )
		{
			gameover = true;
			player_won = possib_winner; 
		}
		else
		{
			row = false;
			col = false;
			diagonal_1 = false;
		}
	}
	
	function check_game_completion():void
	{
	
	var i:int , j:int;
	var validate = true;
		for(i=0;i<3;i++)
		{
			for (j = 0; j < 3; j++)
			{
				if(grid_values[i][j] == 0)
				{
					validate = false;
					break;
				}
			}
			
		}
		if(validate == true)
		{
			gameover = true;
			player_won = 0;
		}
	}
		
	}

}