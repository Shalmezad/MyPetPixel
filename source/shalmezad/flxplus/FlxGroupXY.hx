package shalmezad.flxplus;

import flixel.group.FlxGroup;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;

class FlxGroupXY extends FlxGroup
{
	public var x(default, set):Float = 0;
	public var y(default, set):Float = 0;
	public var velocity(default, default):FlxPoint = new FlxPoint(0,0);
	private var _flickering:Bool = false;
	
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

	public function flicker(Duration:Float = 1, Interval:Float = 0.04, EndVisibility:Bool = true, ForceRestart:Bool = true):Void
	{
		_flickering = true;
		var hasCallback:Bool = false;
		for(object in members)
		{
			var o:FlxObject = cast(object, FlxObject);
			if(hasCallback)
			{
				FlxSpriteUtil.flicker(o, Duration, Interval, EndVisibility, ForceRestart);
			}
			else
			{
				FlxSpriteUtil.flicker(o, Duration, Interval, EndVisibility, ForceRestart, flickerStopped);
				hasCallback = true;
			}
		}
	}

	public function is_flickering():Bool
	{
		return _flickering;
	}

	private function flickerStopped(flicker:FlxFlicker):Void
	{
		_flickering = false;
	}

}
