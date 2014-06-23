package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
//import flixel.math.FlxRandom;
import flixel.util.FlxRandom;

class Pixel extends FlxGroup
{
	var gap:Int = 1;
	var pxSize:Int = 4;
	var pxWidth:Int = 5;
	var pxHeight:Int = 5;

	public function new()
	{
		super();
		//Let's make the graphic:
		makeGraphicFromWord("HI!");
	}
	public function makeGraphicFromWord(word:String):Void
	{
		//clear what we have:
		clear();
		var total:Int = 0;
		for(i in 0...word.length)
		{
			total += word.charCodeAt(i);
		}
		FlxRandom.globalSeed = total;
		//Go through each pixel:
		for(i in 0...pxWidth)
		{
			for(j in 0...pxHeight)
			{
				//Are we doing this pixel?
				if(FlxRandom.chanceRoll())
				{
					//yep
					var spr:FlxSprite = new FlxSprite(i * (pxSize + gap), j * (pxSize + gap));
					var col:Int = FlxRandom.color(100, 255);
					spr.makeGraphic(pxSize, pxSize, col);
					add(spr);
				}
			}
		}
	}

}
