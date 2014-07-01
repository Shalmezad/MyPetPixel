package achievements;

import shalmezad.achievements.Achievement;

class AchieveTurtle extends Achievement
{
	public static var hitCount:Int = 0;

	public function new()
	{
		earnedIconLocation = "assets/images/turtle_earned.png";
		unearnedIconOverlayLocation = "assets/images/turtle_unearned.png";
		title = "Turtle";
		subtitle = "Take a lickin'. Keep on tickin'.";
	}

	override public function isEarned():Bool
	{
		return hitCount > 20;
	}
}
