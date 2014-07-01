package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Bullet extends FlxSprite
{
	public function resetBullet(pixel:Pixel)
	{
		reset(pixel.x, pixel.y);
		if(pixel.controllable)
		{
			makeGraphic(2,2,0xFF33FF33);
		}
		else
		{
			makeGraphic(2,2,0xFFFF3333);
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
