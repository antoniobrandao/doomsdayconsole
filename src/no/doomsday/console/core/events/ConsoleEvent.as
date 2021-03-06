﻿package no.doomsday.console.core.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class ConsoleEvent extends Event 
	{
		public static const COMMAND:String = "consolecommand";
		public static const MESSAGE:String = "consolemessage";
		public static const PROPERTY_UPDATE:String = "onpropertyupdate";
		public var args:Array;
		public var text:String;
		/**
		 * Creates a new ConsoleEvent instance. This is a generic event class that simply holds an array of arguments
		 * @param	type
		 * @param	bubbles
		 * @param	cancelable
		 */
		public function ConsoleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			var e:ConsoleEvent = new ConsoleEvent(type, bubbles, cancelable);
			e.args = args;
			e.text = text;
			return e;
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ConsoleEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}