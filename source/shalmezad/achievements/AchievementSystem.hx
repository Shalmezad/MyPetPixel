package shalmezad.achievements;

class AchievementSystem
{
	private static var _achievements:Array<Achievement> = [];
	private static var _earned:Array<Bool> = [];
	
	public static function addAchievement(a:Achievement):Void
	{
		_achievements.push(a);
		_earned.push(false);
	}

	public static function checkAchievements():Void
	{
		//this goes through, and checks if an achievement has been earned:
		for (i in 0..._achievements.length)
		{
			//did we earn this yet in our quick lookup?
			if(!_earned[i])
			{
				//Alright, do the *real* check. 
				//Did we earn it?
				if(_achievements[i].isEarned())
				{
					//yep.
					_earned[i] = true;
					//trace("Earned: " + _achievements[i].title);
				}	
			}
		}
	}

	//Returns an achievement that has been earned and not seen.
	//Marks it as seen in the process
	//Returns null if one isn't found
	public static function nextNotSeen():Achievement
	{
		//go through each one:
		for (i in 0..._achievements.length)
		{
			//did we earn it?
			if(_earned[i])
			{
				//have we seen it?
				if(!_achievements[i].seen_by_user)
				{
					//Nope, mark it and return:
					_achievements[i].seen_by_user = true;
					return _achievements[i];
				}
			}
		}

		//Nope, guess not:
		return null;
	}

}
