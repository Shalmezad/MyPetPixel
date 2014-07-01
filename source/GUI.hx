package;

import flixel.group.FlxGroup;
import flixel.text.FlxText;

class GUI extends FlxGroup
{

	private var healthText:FlxText;
	private var scoreText:FlxText;

	public function new()
	{
		super();
		healthText = new FlxText(20,20,200,"HEALTH: XX/XX", 16);
		scoreText = new FlxText(20,40,200, "SCORE: XX", 16);

		add(healthText);
		add(scoreText);
	}

	override public function update():Void
	{
		super.update();
		healthText.text = "HEALTH: " + Reg.PS.player.health + "/" + Reg.PS.player.max_health;
		scoreText.text = "SCORE: " + Reg.PS.score;
	}

}
