package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import shalmezad.flxplus.FlxCenterButton;
import shalmezad.achievements.Achievement;
import shalmezad.achievements.AchievementSystem;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var startButton:FlxCenterButton = new FlxCenterButton(Main.gameWidth/2, 200,"START", startGame);
		add(startButton);
		trace("Have we earned achievement? ");
		AchievementSystem.checkAchievements();
		var a:Achievement = AchievementSystem.nextNotSeen();
		if(a != null)
		{
			trace("EARNED: " + a.title);
		}
	}

	private function startGame():Void
	{
		FlxG.switchState(new CreateState());
	}

	override public function update():Void
	{
		super.update();
	}	
}
