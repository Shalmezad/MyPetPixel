package;

import flixel.util.FlxRandom;

class EnemyPixel extends Pixel
{
	public function new()
	{
		super();
		makeGraphic();
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
