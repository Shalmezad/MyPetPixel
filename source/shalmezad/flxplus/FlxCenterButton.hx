package shalmezad.flxplus;

import flixel.ui.FlxButton;

class FlxCenterButton extends FlxButton
{
	public function new(X:Float = 0, Y:Float = 0, ?Text:String, ?OnClick:Void->Void)
	{
		super(X,Y,Text,OnClick);
		x = x - width/2;
		y = y - height/2;
	}
}
