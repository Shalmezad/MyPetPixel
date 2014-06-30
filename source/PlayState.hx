package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxUIInputText;
import flixel.util.FlxMath;

import achievements.AchieveSuicidal;
import achievements.AchieveTurtle;
import shalmezad.achievements.AchievementSystem;

class PlayState extends FlxState
{
	public var player:Pixel;
	var spawner:Spawner;
	var gui:GUI;

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
		//make the gui
		gui = new GUI();

		add(player);
		add(spawner);
		add(gui);

	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		if(!player.is_flickering() && FlxG.overlap(player, spawner))
		{
			AchieveTurtle.hitCount++;
			player.health -= 1;
			player.flicker(1);
			if(player.health <= 0)
			{
				//Game over, go back to main menu
				AchieveSuicidal.deathCount++;
				FlxG.switchState(new MenuState());				
			}
		}
	}	
}
