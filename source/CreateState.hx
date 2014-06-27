package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIInputText;
import flixel.util.FlxMath;

class CreateState extends FlxState
{
	var pixel:Pixel;
	var word:String;
	var inputText:FlxUIInputText;
	var powerStat:FlxText;
	var defenseStat:FlxText;
	var speedStat:FlxText;
	var healthStat:FlxText;


	override public function create():Void
	{
		super.create();
		//make stuff
		pixel = new Pixel();
		word = "";
		inputText = new FlxUIInputText(20,70);
		var button:FlxButton = new FlxButton(20,90,"Make Pixel!", makePixel);
		powerStat = new FlxText(20,120,200, "Power: ");
		defenseStat = new FlxText(20, 130,200, "Defense: ");
		speedStat = new FlxText(20, 140,200, "Speed: ");
		healthStat = new FlxText(20, 150,200, "Health: ");
		var goButton:FlxButton = new FlxButton(20, 200, "GO!", startGame);
		//put it on the screen
		add(button);
		add(pixel);
		add(inputText);
		add(powerStat);
		add(defenseStat);
		add(speedStat);
		add(healthStat);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	

	private function makePixel():Void
	{
		if(inputText.text != word)
		{
			word = inputText.text;
			pixel.makeGraphicFromWord(word);
			pixel.makeStatsFromWord(word);
			powerStat.text = "Power: " + Std.string(pixel.power);
			defenseStat.text = "Defense: " + Std.string(pixel.defense);
			speedStat.text = "Speed: " + Std.string(pixel.speed);
			healthStat.text = "Health: " + Std.string(pixel.health);
		}
	}

	private function startGame():Void
	{
		Reg.word = word;
		FlxG.switchState(new PlayState());
	}

}
