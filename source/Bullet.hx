package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRandom;

class Bullet extends FlxSprite
{
	private var speedMultiplier:Float = 20;
	public var damage:Int = 1;
	public function resetBullet(pixel:Pixel)
	{
		reset(pixel.x, pixel.y + pixel.height/2);
		damage = FlxRandom.intRanged(1, pixel.power);
		var color:Int = 0xFFFFFFFF;
		//higher damage = brighter bullet. 
		color = FlxRandom.color(Std.int(damage*150/20 + 105), Std.int(damage*150/20 + 105));
		makeGraphic(2,2,color);
		if(pixel.controllable)
		{
			velocity.x = pixel.speed * speedMultiplier;
		}
		else
		{
			velocity.x = -1 * pixel.speed * speedMultiplier;
		}
	}	
	override public function update():Void
	{
		super.update();
		if(!isOnScreen(FlxG.camera))
		{
			kill();
		}
	}
}
