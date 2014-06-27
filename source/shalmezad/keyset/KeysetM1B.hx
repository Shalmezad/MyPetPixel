package shalmezad.keyset;

import flixel.FlxG;

//Used to provide a quick keyset. Helpful for getting input quickly
//This is the 'move one button' keyset, which has a WASD and ONE key
//Jump, shoot, and special all point to the same keys.
class KeysetM1B 
{
	public static var UP(get, never):Bool;
	public static var DOWN(get, never):Bool;
	public static var LEFT(get, never):Bool;
	public static var RIGHT(get, never):Bool;
	public static var SPECIAL(get, never):Bool;
	public static var JUMP(get, never):Bool;
	public static var SHOOT(get, never):Bool;

	private static function get_UP():Bool
	{
		return FlxG.keys.pressed.UP || FlxG.keys.pressed.W;
	}
	private static function get_DOWN():Bool
	{
		return FlxG.keys.pressed.DOWN || FlxG.keys.pressed.D;
	}
	private static function get_LEFT():Bool
	{
		return FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A;
	}
	private static function get_RIGHT():Bool
	{
		return FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D;
	}

	private static function get_SPECIAL():Bool
	{
		return FlxG.keys.pressed.SPACE || 
			FlxG.keys.pressed.Z || 
			FlxG.keys.pressed.X ||
			FlxG.keys.pressed.F;
	}
	private static function get_JUMP():Bool
	{
		return get_SPECIAL();
	}
	private static function get_SHOOT():Bool
	{
		return get_SPECIAL();
	}
}
