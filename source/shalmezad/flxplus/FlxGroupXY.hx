package shalmezad.flxplus;

import flixel.group.FlxGroup;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.util.FlxPoint;

class FlxGroupXY extends FlxGroup
{
	public var x(default, set):Float = 0;
	public var y(default, set):Float = 0;
	public var velocity(default, default):FlxPoint = new FlxPoint(0,0);
	
	private function set_x(Value:Float):Float
	{
		var offset:Float = Value - x;
		for(object in members)
		{
			var o:FlxObject = cast(object, FlxObject);
			o.x += offset;
		}
		return x = Value;
	}

	private function set_y(Value:Float):Float
	{
		var offset:Float= Value - y;
		for(object in members)
		{
			var o:FlxObject = cast(object, FlxObject);
			o.y += offset;
		}
		return y = Value;
	}

	override public function update():Void
	{
		super.update();
		this.x += velocity.x;
		this.y += velocity.y;
	}

}
