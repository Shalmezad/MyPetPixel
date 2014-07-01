package achievements;

import shalmezad.achievements.Achievement;

class AchieveSuicidal extends Achievement
{
	public static var deathCount:Int = 0;

	public function new()
	{
		earnedIconLocation = "assets/images/suicide_earned.png";
		unearnedIconOverlayLocation = "assets/images/suicide_unearned.png";
		title = "Suicidal";
		subtitle = "Died (a lot)";
	}

	override public function isEarned():Bool
	{
		return deathCount > 1;
	}
}
