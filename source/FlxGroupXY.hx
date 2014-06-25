package;

import flixel.group.FlxGroup;
import flixel.FlxBasic;
import flixel.FlxObject;

class FlxGroupXY extends FlxGroup
{
	public var x(default, set):Int = 0;
	public var y(default, set):Int = 0;
	
	private function set_x(Value:Int):Int
	{
		var offset:Int = Value - x;
		for(object in members)
		{
			var o:FlxObject = cast(object, FlxObject);
			o.x += offset;
		}
		return x = Value;
	}

	private function set_y(Value:Int):Int
	{
		var offset:Int = Value - y;
		for(object in members)
		{
			var o:FlxObject = cast(object, FlxObject);
			o.y += offset;
		}
		return y = Value;
	}

}
