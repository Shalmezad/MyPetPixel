package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIInputText;
import flixel.util.FlxMath;

class PlayState extends FlxState
{
	var player:Pixel;
	override public function create():Void
	{
		super.create();
		//build the player
		player = new Pixel();
		player.makeGraphicFromWord(Reg.word);
		player.makeStatsFromWord(Reg.word);
		player.controllable = true;
		add(player);
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
}
