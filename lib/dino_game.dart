import 'dart:ui';

import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:reno_bar/bar_center.dart';
import 'package:reno_bar/dino_player.dart';
import 'package:reno_bar/dino_world.dart';

class DinoGame extends FlameGame with HasTappableComponents {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoWorld _dinoWorld = DinoWorld();
   final BarCenter _barCenter = BarCenter();
   final BarLeft _barLeft = BarLeft();
   final BarRight _barRight = BarRight();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_dinoWorld);
    await add(_dinoPlayer);
    // await add(_barCenter);
    await add(_barLeft);
    await add(_barRight);
    _dinoPlayer.position =
        Vector2(_dinoWorld.size.x / 2.5, _dinoWorld.size.y / 1.3);
    camera.followComponent(
      _dinoPlayer,
      worldBounds: Rect.fromLTRB(0, 0, _dinoWorld.size.x, _dinoWorld.size.y),
    );
  }


  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    RemoveEffect effect = RemoveEffect(delay: 0);

    if(!children.contains(_barCenter)){
      add(_barCenter);
    }

    if((children.contains(_barLeft) || children.contains(_barRight))){
      _barLeft.add(RemoveEffect(delay: 0));
      _barRight.add(RemoveEffect(delay: 0));
    }

  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);

    if(children.contains(_barCenter)){
      _barCenter.add(RemoveEffect(delay: 0));
    }

    if(!(children.contains(_barLeft) || children.contains(_barRight))){
      add(_barLeft);
      add(_barRight);
    }
  }

}
