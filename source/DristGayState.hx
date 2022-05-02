package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.FlxCamera;

class DristGayState extends MusicBeatState
{
  var bg:FlxSprite;
  var accept:FlxSprite;

    override function create()
    {
        super.create();

        bg = new FlxSprite().loadGraphic(Paths.image('dristgayover'));
        bg.screenCenter();
        bg.visible = true;
        add(bg);

        accept = new FlxSprite().loadGraphic(Paths.image('dristaccept'));
        accept.visible = false;
        accept.screenCenter();
        add(accept);
      
      #if android

       addVirtualPad(NONE, A_B);

       addPadCamera();

       #end

    }

    override function update(elapsed:Float) {
        if(Control.ACCEPT) {
            bg.visible = false;
            FlxG.camera.flash(FlxColor.WHITE, 1);
            accept.visible = true;
	    new FlxTimer().start(0.8, function(dristTimer:FlxTimer)
             MusicBeatState.switchState(new MainMenuState()));
            }
         if(Control.BACK)
           {
            flash.system.System.exit(0);
           }
          super.update(elapsed);
      }
}
