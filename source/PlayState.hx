package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.addons.ui.FlxUIInputText;

import shalmezad.achievements.AchievementSystem;

import achievements.AchieveSuicidal;
import achievements.AchieveTurtle;

class PlayState extends FlxState
{
	public var player:Pixel;
	//The bullets are public so they can be accessed by the 'shooting' objects (players/enemies)
	public var enemyBullets:FlxTypedGroup<Bullet>;
	public var playerBullets:FlxTypedGroup<Bullet>;
	private var spawner:Spawner;
	private var gui:GUI;


	public function new():Void
	{
		super();
		Reg.PS = this;
	}

	override public function create():Void
	{
		super.create();

		//build the player
		player = new Pixel();
		player.makeGraphicFromWord(Reg.word);
		player.makeStatsFromWord(Reg.word);
		player.controllable = true;

		//build the enemies
		spawner = new Spawner();

		//build the bullet groups
		enemyBullets = new FlxTypedGroup<Bullet>();
		playerBullets = new FlxTypedGroup<Bullet>();

		//make the gui
		gui = new GUI();

		//add everything to the 'stage'
		add(player);
		add(spawner);
		add(enemyBullets);
		add(playerBullets);
		add(gui);
	}
	
	override public function destroy():Void
	{
		super.destroy();
		//"set everything to null to help the garbage collector"
		//Well, at least I don't have to clean up my own garbage. 
		player = null;
		spawner = null;
		gui = null;
		enemyBullets = null;
		playerBullets = null;
	}

	override public function update():Void
	{
		super.update();
		//The player handles it's own input, so we don't have to worry about it.
		//But we do have to worry about object-object interaction:
		handleCollisions();
	}	

	private function handleCollisions():Void
	{
		//if player-enemy or player-enemy_bullet, hurt player:
		if(FlxG.overlap(player, spawner) && FlxG.overlap(player, enemyBullets))
		{
			hurtPlayer();	
		}
		//player_bullet-enemy = hurt enemy:
		FlxG.overlap(playerBullets, spawner, bulletEnemyOverlap);
	}

	private function hurtPlayer():Void
	{
		if(player.hurt(1))
		{
			AchieveTurtle.hitCount++;
			if(player.health <= 0)
			{
				//Game over, go back to main menu
				AchieveSuicidal.deathCount++;
				FlxG.switchState(new MenuState());				
			}
		}	
	}

	private function bulletEnemyOverlap(bullet:Dynamic, enemy:Dynamic):Void
	{
		enemy.hurt(1);
	}

}
