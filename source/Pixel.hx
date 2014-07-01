package;

import shalmezad.keyset.KeysetM1B;
import shalmezad.flxplus.FlxGroupXY;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;

class Pixel extends FlxGroupXY
{
	var speedMultiplier:Float = 1;
	var gap:Int = 1;
	var pxSize:Int = 8;
	var pxWidth:Int = 5;
	var pxHeight:Int = 5;

	public var power:Int = 0;
	public var defense:Int = 0;
	public var speed:Int = 0;
	public var health:Int = 0;
	public var max_health:Int = 0;
	public var controllable:Bool = false;

	public var width:Int;
	public var height:Int;

	private var cooldown:Int = 0;

	public function new()
	{
		super();
		active = true;
		width = pxWidth * (pxSize + gap);
		height = pxHeight * (pxSize * gap);
		x = 50;
		//Let's make the graphic:
		//makeGraphicFromWord("HI!");
	}

	public function makeStatsFromWord(word:String):Void
	{
		FlxRandom.globalSeed = strTotal(word);
		makeStats();
	}

	private function makeStats():Void
	{
		power = FlxRandom.intRanged(2,20);
		defense = FlxRandom.intRanged(2,20);
		speed = FlxRandom.intRanged(2,20);
		health = FlxRandom.intRanged(2,20);
		max_health = health;
	}

	public function makeGraphicFromWord(word:String):Void
	{
		//clear what we have:
		clear();
		FlxRandom.globalSeed = strTotal(word);
		makeGraphic();
	}

	private function makeGraphic():Void
	{
		//Go through each pixel:
		for(i in 0...pxWidth)
		{
			for(j in 0...pxHeight)
			{
				//Are we doing this pixel?
				if(FlxRandom.chanceRoll())
				{
					//yep
					var spr:FlxSprite = new FlxSprite(i * (pxSize + gap) + x, j * (pxSize + gap) + y);
					var col:Int = getRandomColor();
				spr.makeGraphic(pxSize, pxSize, col);
					add(spr);
				}
			}
		}
	}

	private function getRandomColor():Int
	{
		//return FlxRandom.color(100, 255);
		return FlxRandom.colorExt(0,100, 150,255);
	}

	/**
	 * Returns an integer based on the string passed in. Used for seeding.
	 */
	private function strTotal(word:String):Int
	{
		var total:Int = 0;
		for(i in 0...word.length)
		{
			total += word.charCodeAt(i);
			total *= 10;
		}
		return total;
	}

	override public function update():Void
	{
		super.update();
		if(active && alive)
		{
			if(controllable)
			{
				handleInput();
			}
			else
			{
				//computers always shoot when possible
				tryShot();
			}
			cooldown--;
		}
	}

	private function handleInput():Void
	{
		velocity.x = 0;
		velocity.y = 0;
		//if(FlxG.keys.pressed.LEFT)
		if (KeysetM1B.LEFT && !KeysetM1B.RIGHT)
		{
			velocity.x = -1 * speed * speedMultiplier;	
		}
		else if (KeysetM1B.RIGHT && !KeysetM1B.LEFT)
		{
			velocity.x = speed * speedMultiplier;
		}
		if (KeysetM1B.UP && !KeysetM1B.DOWN)
		{
			velocity.y = -1 * speed * speedMultiplier;
		}
		else if (KeysetM1B.DOWN && !KeysetM1B.UP)
		{
			velocity.y = speed * speedMultiplier;
		}
		//handle shooting while we're at it 
		if (KeysetM1B.SHOOT)
		{
			tryShot();	
		}
		//NOTE: If we're input based, keep us on screen:
		keepInBounds();
	}

	private function keepInBounds():Void
	{
		if (x < 0) 
		{
			x = 0;
		}
		else if (x + width > 640)
		{
			x = 640 - width;
		}
		if (y < 0)
		{
			y = 0;
		}
		else if (y + height > 480)
		{
			y = 480 - height;
		}
	}


	private function tryShot():Void
	{
		if(cooldown <= 0)
		{	
			//success, shoot
			//recycle a bullet:
			var bullet:Bullet = null;
			if(controllable)
			{
				bullet = Reg.PS.playerBullets.recycle(Bullet);
			}
			else
			{
				bullet = Reg.PS.enemyBullets.recycle(Bullet);
			}
			bullet.resetBullet(this);
			//reset it:
			//reset the cooldown so they're not spamming it:
			cooldown = 25 - speed;
		}
	}
	
	public function hurt(damage:Int):Bool
	{
		var maxDamage:Int = defense - damage;
		//bullets always hurt
		if(maxDamage <= 0) maxDamage = 1;
		//but we don't want UBEROVERKILL!!!1!!
		if(maxDamage >= 5) maxDamage = 5;
	
		if(!is_flickering())
		{
			//Even then, the damage is random:
			health -= FlxRandom.intRanged(1,damage);
			flicker(1);
			if(health <= 0)
			{
				kill();
			}
			return true;
		}
		return false;
	}
}
