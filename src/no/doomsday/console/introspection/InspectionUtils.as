﻿package no.doomsday.console.introspection 
{
	import no.doomsday.console.text.autocomplete.AutocompleteDictionary;
	import flash.display.DisplayObjectContainer;
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class InspectionUtils
	{
		private static var desc:XML;
		public function InspectionUtils() 
		{
			
		}
		public static function getAutoCompleteDictionary(o:*):AutocompleteDictionary {
			desc = describeType(o);
			var dict:AutocompleteDictionary = new AutocompleteDictionary();
			//get all methods
			var node:XML;
			var list:XMLList = desc..method;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..variable;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..method;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			list = desc..accessor;
			for each(node in list) {
				dict.addToDictionary(node.@name);
			}
			if (o is DisplayObjectContainer) {
				var i:int = o.numChildren;
				for (i > 0; i--; ) 
				{
					dict.addToDictionary(o.getChildAt(i).name);
				}
			}
			
			return dict;
		}
		public static function getAccessors(o:*):Vector.<AccessorDesc> {
			desc = describeType(o);
			var vec:Vector.<AccessorDesc> = new Vector.<AccessorDesc>();
			var node:XML;
			var list:XMLList = desc..accessor;
			for each(node in list) {
				vec.push(new AccessorDesc(node));
			}
			return vec;
		}
		public static function getMethods(o:*):Vector.<MethodDesc> {
			desc = describeType(o);
			var vec:Vector.<MethodDesc> = new Vector.<MethodDesc>();
			var node:XML;
			var list:XMLList = desc..method;
			for each(node in list) {
				vec.push(new MethodDesc(node));
			}
			return vec;
		}
		public static function getVariables(o:*):Vector.<VariableDesc> {
			desc = describeType(o);
			var vec:Vector.<VariableDesc> = new Vector.<VariableDesc>();
			var node:XML;
			var list:XMLList = desc..variable;
			for each(node in list) {
				vec.push(new VariableDesc(node));
			}
			return vec;
		}
		
	}

}