package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIInputText;
import flixel.util.FlxMath;
import shalmezad.flxplus.FlxCenterButton;

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
		var centerX:Float= Main.gameWidth/2;
		//make stuff
		pixel = new Pixel();
		pixel.active = false;
		word = "";
		pixel.makeGraphicFromWord(word);
		pixel.x = Main.gameWidth/2 - pixel.width/2;
		pixel.y = 10;
		inputText = new FlxUIInputText(20,70);
		inputText.x = Main.gameWidth/2 - inputText.width / 2;
		var button:FlxCenterButton = new FlxCenterButton(Main.gameWidth/2,100,"Make Pixel!", makePixel);
		powerStat = new FlxText(centerX-100,120,200, "Power: ");
		powerStat.alignment = "center";
		defenseStat = new FlxText(centerX-100, 130,200, "Defense: ");
		defenseStat .alignment = "center";
		speedStat = new FlxText(centerX-100, 140,200, "Speed: ");
		speedStat .alignment = "center";
		healthStat = new FlxText(centerX-100, 150,200, "Health: ");
		healthStat .alignment = "center";
		var goButton:FlxCenterButton = new FlxCenterButton(Main.gameWidth/2,200,"GO!",startGame);
		var instructions:String = "Instructions: Type in a name, and click 'Make Pixel' to build a pixel. Better words = better pixels!";
		var instText = new FlxText(50, 300, Main.gameWidth - 100, instructions);
		instText.alignment = "center";

		//put it on the screen
		add(button);
		add(pixel);
		add(inputText);
		add(powerStat);
		add(defenseStat);
		add(speedStat);
		add(healthStat);
		add(instText);
		add(goButton);
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
