package shalmezad.achievements;

import flixel.group.FlxGroup;
import flixel.text.FlxText;

enum PopupState {
	WAITING;	//Popup is waiting for an achievement to show
	SHOWING;	//Currently showing an achievement
}

class AchievementPopup extends FlxGroup
{
	private var currentState:PopupState = WAITING;

	private var titleText:FlxText;

	public function new():Void
	{
		super();
		titleText = new FlxText(20,400,200,"");
		add(titleText);
	}

	override public function update():Void
	{
		super.update();
		//Are we waiting?
		if(currentState == WAITING)
		{
			//Check for a popup	
			var a:Achievement = AchievementSystem.nextNotSeen();
			if(a != null)
			{
				//Holy smokes! We have one!
				showAchievement(a);
			}
		}
	}

	private function showAchievement(a:Achievement):Void
	{
		titleText.text = a.title;
		currentState = SHOWING;
	}


}
