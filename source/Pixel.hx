package;

import shalmezad.keyset.KeysetM1B;
import shalmezad.flxplus.FlxGroupXY;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;

class Pixel extends FlxGroupXY
{
	var speedMultiplier:Float = 1;
	var gap:Int = 1;
	var pxSize:Int = 4;
	var pxWidth:Int = 5;
	var pxHeight:Int = 5;

	public var power:Int = 0;
	public var defense:Int = 0;
	public var speed:Int = 0;
	public var health:Int = 0;
	public var controllable:Bool = false;

	public var width:Int;
	public var height:Int;

	public function new()
	{
		super();
		width = pxWidth * (pxSize + gap);
		height = pxHeight * (pxSize * gap);
		x = 50;
		//Let's make the graphic:
		//makeGraphicFromWord("HI!");
	}

	public function makeStatsFromWord(word:String):Void
	{
		FlxRandom.globalSeed = strTotal(word);
		makeStats();
	}

	private function makeStats():Void
	{
		power = FlxRandom.intRanged(2,20);
		defense = FlxRandom.intRanged(2,20);
		speed = FlxRandom.intRanged(2,20);
		health = FlxRandom.intRanged(2,20);
	}

	public function makeGraphicFromWord(word:String):Void
	{
		//clear what we have:
		clear();
		FlxRandom.globalSeed = strTotal(word);
		makeGraphic();
	}

	private function makeGraphic():Void
	{
		//Go through each pixel:
		for(i in 0...pxWidth)
		{
			for(j in 0...pxHeight)
			{
				//Are we doing this pixel?
				if(FlxRandom.chanceRoll())
				{
					//yep
					var spr:FlxSprite = new FlxSprite(i * (pxSize + gap) + x, j * (pxSize + gap) + y);
					var col:Int = getRandomColor();
				spr.makeGraphic(pxSize, pxSize, col);
					add(spr);
				}
			}
		}
	}

	private function getRandomColor():Int
	{
		//return FlxRandom.color(100, 255);
		return FlxRandom.colorExt(0,100, 150,255);
	}

	/**
	 * Returns an integer based on the string passed in. Used for seeding.
	 */
	private function strTotal(word:String):Int
	{
		var total:Int = 0;
		for(i in 0...word.length)
		{
			total += word.charCodeAt(i);
		}
		return total;
	}

	override public function update():Void
	{
		super.update();
		if(controllable)
		{
			handleInput();
		}
	}

	private function handleInput():Void
	{
		velocity.x = 0;
		velocity.y = 0;
		//if(FlxG.keys.pressed.LEFT)
		if (KeysetM1B.LEFT && !KeysetM1B.RIGHT)
		{
			velocity.x = -1 * speed * speedMultiplier;	
		}
		//else if (FlxG.keys.pressed.RIGHT)
		else if (KeysetM1B.RIGHT && !KeysetM1B.LEFT)
		{
			velocity.x = speed * speedMultiplier;
		}
		//if (FlxG.keys.pressed.UP)
		if (KeysetM1B.UP && !KeysetM1B.DOWN)
		{
			velocity.y = -1 * speed * speedMultiplier;
		}
		//else if (FlxG.keys.pressed.DOWN)
		else if (KeysetM1B.DOWN && !KeysetM1B.UP)
		{
			velocity.y = speed * speedMultiplier;
		}
	}

}
