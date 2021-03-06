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
        bg.setGraphicSize(Std.int(bg.width * 0.7));
        bg.visible = true;
        add(bg);

        accept = new FlxSprite().loadGraphic(Paths.image('dristaccept'));
        accept.visible = false;
        accept.setGraphicSize(Std.int(accept.width * 0.6));
        accept.screenCenter();
        add(accept);
      
      #if android

       addVirtualPad(NONE, A_B);

       addPadCamera();

       #end

    }

    override function update(elapsed:Float) {
        if(controls.ACCEPT) {
            FlxG.sound.play(Paths.sound('pomilsya'), 0.7);
            FlxG.camera.flash(FlxColor.WHITE, 1);
            bg.visible = false;
            accept.visible = true;
	    new FlxTimer().start(5, function(dristTimer:FlxTimer)
            MusicBeatState.switchState(new MainMenuState()));
            PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
            }
         if(controls.BACK)
           {
            flash.system.System.exit(0);
           }
          super.update(elapsed);
      }
}
