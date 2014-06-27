package ;

import flixel.group.FlxTypedGroup;
import flixel.util.FlxRandom;

class Spawner extends FlxTypedGroup<EnemyPixel>
{
	var SPAWN_MIN_TIME:Int = 60;
	var SPAWN_MAX_TIME:Int = 100;
	var spawnCooldown:Int = 150;	
	override public function update():Void
	{
		super.update();
		spawnCooldown--;
		if(spawnCooldown <= 0)
		{
			spawn();
			spawnCooldown = FlxRandom.intRanged(SPAWN_MIN_TIME, SPAWN_MAX_TIME);
		}
	}

	private function spawn():Void
	{
		//reduce, reuse, and:
		var enemyPixel:EnemyPixel = this.recycle(EnemyPixel);
		//yep, we now have "something". Not sure if it's new or old, so:
		enemyPixel.resetPixel();
		//it should already be in the group due to the nature of recycle.
		//So, we should be good to go!
	}
}
