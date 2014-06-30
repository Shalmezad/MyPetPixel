package shalmezad.achievements;

import flixel.group.FlxGroup;
import flixel.text.FlxText;

enum PopupState {
	WAITING;	//Popup is waiting for an achievement to show
	POPING_UP;	//Going up...
	SHOWING;	//Currently showing an achievement
	POPING_DOWN;	//Going down. Bwa-ha-ha 
		//related: http://www.bash.org/?12431
}

class AchievementPopup extends FlxGroup
{
	private var showLength:Int = 60;

	private var currentState:PopupState = WAITING;
	private var titleText:FlxText;
	private var currentStateCount:Int = 0;

	public function new():Void
	{
		super();
		titleText = new FlxText(20,400,200,"");
		titleText.visible = false;
		add(titleText);
	}

	override public function update():Void
	{
		super.update();
		currentStateCount++;
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
		else if(currentState == SHOWING)
		{
			if(currentStateCount >= showLength)
			{
				hideAchievement();
			}
		}
	}

	private function showAchievement(a:Achievement):Void
	{
		titleText.text = a.title;
		titleText.visible = true;
		switchState(SHOWING);
	}

	private function hideAchievement():Void
	{
		titleText.visible = false;
		switchState(WAITING);	
	}

	private function switchState(s:PopupState):Void
	{
		currentState = s;
		currentStateCount = 0;
	}


}
