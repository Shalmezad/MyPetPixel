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
import shalmezad.achievements.AchievementPopup;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var titleText:FlxText = new FlxText(0, 50, Main.gameWidth, "PIXEL WARS", 32);
		titleText.alignment = "center";
		add(titleText);
		var artistText:FlxText = new FlxText(0, 90, Main.gameWidth, "BY: SHALMEZAD", 16);
		artistText.alignment = "center";
		add(artistText);
		var startButton:FlxCenterButton = new FlxCenterButton(Main.gameWidth/2, 200,"START", startGame);
		add(startButton);
		//do a quick check on the existing achievments
		AchievementSystem.checkAchievements();
		//add the achievement popup. It'll automatically display achievements.
		add(new AchievementPopup());
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
