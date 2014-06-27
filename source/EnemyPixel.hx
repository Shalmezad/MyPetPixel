package;

import flixel.util.FlxRandom;

class EnemyPixel extends Pixel
{
	public function new()
	{
		super();
		resetPixel();
	}

	public function resetPixel():Void
	{
		makeGraphic();
		makeStats();
		x = 640;
		//set a course:
		velocity.x = -1 * speed * speedMultiplier;
		y = FlxRandom.intRanged(0,480-height);
		alive = true;
	}

	override private function getRandomColor():Int
	{
		return FlxRandom.colorExt(150,255,0,100,0,100);		
	}

	override public function update():Void
	{
		super.update();
		if(x + width < 0)
		{
			kill();
		}
	}
}
