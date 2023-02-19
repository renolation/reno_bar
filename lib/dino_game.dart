import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:reno_bar/bar_center.dart';
import 'package:reno_bar/dino_player.dart';
import 'package:reno_bar/dino_world.dart';
import 'package:reno_bar/saw.dart';
import 'package:reno_bar/enemy_manager.dart';

class DinoGame extends FlameGame with HasTappables, HasCollisionDetection {
  final DinoPlayer dinoPlayer = DinoPlayer();
  final DinoWorld dinoWorld = DinoWorld();
  late final BarCenter barLeft;
  late final BarCenter barRight;
  late final BarCenter barCenter;


  late EnemyManager _enemyManager;

  late TextComponent _playerHealth;
  late TextComponent _playerScore;




  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(dinoWorld);
    await add(dinoPlayer);


    barLeft = BarCenter(
        await loadSprite('bar_left.png'),
        Vector2(size.x - (size.x / 10 * 9), size.y * 11 / 15)
    );
    await add(barLeft);


    barRight = BarCenter(
        await loadSprite('bar_right.png'),
        Vector2((size.x / 10 * 9), size.y * 11 / 15)
    );
    await add(barRight);

    barCenter = BarCenter(
        await loadSprite('bar_center.png'),
        Vector2(size.x /2, size.y * 11 / 15)
    );


    camera.followComponent(
      dinoPlayer,
      worldBounds: Rect.fromLTRB(0, 0, dinoWorld.size.x, dinoWorld.size.y),
    );
    _enemyManager = EnemyManager();
    add(_enemyManager);



    //region score
    _playerScore = TextComponent(text: 'Score :0',
      position: Vector2(10, 40),
      textRenderer: TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),);
    _playerScore.positionType = PositionType.viewport;
    _playerScore.is
    add(_playerScore);

    _playerHealth = TextComponent(text: 'Health :0',
      position: Vector2(size.x - 10, 40),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),);
    _playerHealth.anchor = Anchor.topRight;
    _playerHealth.positionType = PositionType.viewport;

    add(_playerHealth);
    //endregion


  }


  @override
  void update(double dt) {
    super.update(dt);
    _playerScore.text = 'Score ${dinoPlayer.score}';
    _playerHealth.text = 'Health ${dinoPlayer.health}';
  }


  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(size.x-80, 40, dinoPlayer.health.toDouble(), 20), Paint()..color = Colors.green.withOpacity(0.9));

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




}
