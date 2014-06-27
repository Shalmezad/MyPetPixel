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
	public var player:Pixel;
	var spawner:Spawner;

	public function new():Void
	{
		super();
		Reg.PS = this;
	}

	override public function create():Void
	{
		super.create();

		//build the player
		player = new Pixel();
		player.makeGraphicFromWord(Reg.word);
		player.makeStatsFromWord(Reg.word);
		player.controllable = true;
		//build the enemies
		spawner = new Spawner();

		add(player);
		add(spawner);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
}
