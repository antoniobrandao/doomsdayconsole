﻿package no.doomsday.console.math 
{
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	public class MathUtils
	{
		
		public function MathUtils() 
		{
			
		}
		public static function random(from:Number = 0, to:Number = 1):Number {
			return from + Math.random() * (to - from);
		}
		public static function add(a:Number, b:Number):Number {
			return a + b;
		}
		public static function subtract(a:Number, b:Number):Number {
			return a - b;
		}
		public static function divide(a:Number, b:Number):Number {
			return a / b;
		}
		public static function multiply(a:Number, b:Number):Number {
			return a * b;
		}
		
	}

}