import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:reno_bar/bar_center.dart';
import 'package:reno_bar/dino_player.dart';
import 'package:reno_bar/dino_world.dart';
import 'package:reno_bar/enemy.dart';

class DinoGame extends FlameGame with HasTappables {
  final DinoPlayer dinoPlayer = DinoPlayer();
  final DinoWorld dinoWorld = DinoWorld();
   final BarCenter barCenter = BarCenter();
   final BarLeft barLeft = BarLeft();
   final BarRight barRight = BarRight();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(dinoWorld);
    await add(dinoPlayer);
    await add(barLeft);
    await add(barRight);

   await add(Enemy(
     sprite: await loadSprite('Saw.png'),
     size: Vector2(64,64),
     position: Vector2(dinoWorld.size.x/2, 0),
   )..anchor = Anchor.topCenter);

    camera.followComponent(
      dinoPlayer,
      worldBounds: Rect.fromLTRB(0, 0, dinoWorld.size.x, dinoWorld.size.y),
    );

  }


  @override
  void onTapUp(int pointerId, TapUpInfo info) {
    super.onTapUp(pointerId, info);
    if (info.handled) {
      if(children.contains(barCenter)){
        barCenter.add(RemoveEffect(delay: 0));
      }
      if(!(children.contains(barLeft) || children.contains(barRight))){
        add(barLeft);
        add(barRight);
      }
    }
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    super.onTapDown(pointerId, info);
    if (info.handled) {
      RemoveEffect effect = RemoveEffect(delay: 0);
      if(!children.contains(barCenter)){
        add(barCenter);
      }
      if((children.contains(barLeft) || children.contains(barRight))){
        barLeft.add(RemoveEffect(delay: 0));
        barRight.add(RemoveEffect(delay: 0));
      }

    }

  }


  // @override
  // void onTapDown(TapDownEvent event) {
  //   super.onTapDown(event);
  //   RemoveEffect effect = RemoveEffect(delay: 0);
  //   if(!children.contains(_barCenter)){
  //     add(_barCenter);
  //   }
  //   if((children.contains(_barLeft) || children.contains(_barRight))){
  //     barLeft.add(RemoveEffect(delay: 0));
  //     barRight.add(RemoveEffect(delay: 0));
  //   }
  //
  // }
  //
  // @override
  // void onTapUp(TapUpEvent event) {
  //   super.onTapUp(event);
  //
  //   if(children.contains(_barCenter)){
  //     barCenter.add(RemoveEffect(delay: 0));
  //   }
  //
  //   if(!(children.contains(_barLeft) || children.contains(_barRight))){
  //     add(_barLeft);
  //     add(_barRight);
  //   }
  // }

}
