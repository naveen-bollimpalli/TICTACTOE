package com.tictactoe 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author naveen bollimpalli
	 */
	public class ResultNotifier extends Event
	{
		public static const RESULT:String = "result";
      
		private var _result:String = "none";
      
		  public function get result():String {
			 return _result;
		  }
		public function ResultNotifier(type:String, result:String) 
		{
			super(type, true);
			_result = result;
		}
		
		public override function clone():Event {
         return new ResultNotifier(type, _result);
		}
	}

}