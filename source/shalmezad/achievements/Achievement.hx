package shalmezad.achievements;

class Achievement
{
	//where the unearned overlay is. Can be the same between achievements (ie: a locked icon)
	//Can also be non-transparent (ie: a greyed out version of the icon)
	public var unearnedIconOverlayLocation:String;
	//Where the *earned* icon is
	public var earnedIconLocation:String;
	//The title of the achievement
	public var title:String;
	//The subtitle of the achievement
	public var subtitle:String;

	public var seen_by_user:Bool = false;
	
	public function isEarned():Bool
	{
		return throw "Abstract method Achievment::isEarned not implemented!";
	}


}
