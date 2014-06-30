package achievements;

import shalmezad.achievements.Achievement;

class AchieveSuicidal extends Achievement
{
	public static var deathCount:Int = 0;

	public function new()
	{

		title = "Suicidal";
		subtitle = "Died (a lot)";
	}

	override public function isEarned():Bool
	{
		return deathCount > 1;
	}
}
