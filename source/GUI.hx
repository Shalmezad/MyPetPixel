package;

import flixel.group.FlxGroup;
import flixel.text.FlxText;

class GUI extends FlxGroup
{

	private var healthText:FlxText;

	public function new()
	{
		super();
		healthText = new FlxText(20,20,200,"HEALTH: XX/XX", 16);


		add(healthText);
	}

	override public function update():Void
	{
		super.update();
		healthText.text = "HEALTH: " + Reg.PS.player.health + "/" + Reg.PS.player.max_health;
	}

}
