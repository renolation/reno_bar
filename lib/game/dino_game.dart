import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:reno_bar/game/bar_center.dart';
import './dino_player.dart';
import 'package:reno_bar/game/dino_world.dart';
import './saw.dart';
import 'package:reno_bar/game/enemy_manager.dart';
import 'package:reno_bar/widgets/overlays/game_over_menu.dart';

import 'command.dart';
import '../widgets/overlays/pause_button.dart';
import '../widgets/overlays/pause_menu.dart';
import 'dino_player.dart';

class DinoGame extends FlameGame with HasTappables, HasCollisionDetection {
  final DinoPlayer _dinoPlayer = DinoPlayer();
  final DinoWorld dinoWorld = DinoWorld();
  late final BarCenter barLeft;
  late final BarCenter barRight;
  late final BarCenter barCenter;


  late EnemyManager _enemyManager;

  late TextComponent _playerHealth;
  late TextComponent _playerScore;


  final _commandList = List<Command>.empty(growable: true);
  final _addLaterCommandList = List<Command>.empty(growable: true);

  bool _isAlreadyLoaded = false;


  @override
  Future<void> onLoad() async {
    super.onLoad();
    if(!_isAlreadyLoaded){
      await add(dinoWorld);
      await add(_dinoPlayer);


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
        _dinoPlayer,
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

      // Set this to true so that we do not initilize
      // everything again in the same session.
      _isAlreadyLoaded = true;
    }



  }


  @override
  void update(double dt) {
    super.update(dt);

    for (var command in _commandList) {
      for (var component in children) {
        command.run(component);
      }
    }
    _commandList.clear();
    _commandList.addAll(_addLaterCommandList);
    _addLaterCommandList.clear();

    _playerScore.text = 'Score ${_dinoPlayer.score}';
    _playerHealth.text = 'Health ${_dinoPlayer.health}';

    if(_dinoPlayer.health <= 0 && !camera.shaking){
        pauseEngine();
        overlays.remove(PauseButton.id);
        overlays.add(GameOverMenu.id);
    }

  }


  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(Rect.fromLTWH(size.x-80, 40, _dinoPlayer.health.toDouble(), 20), Paint()..color = Colors.green.withOpacity(0.9));

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


  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch(state){

      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:

      case AppLifecycleState.detached:
        if(_dinoPlayer.health > 0){
          pauseEngine();
          overlays.remove(PauseButton.id);
          overlays.add(PauseMenu.id);
        }
        break;
    }
    super.lifecycleStateChange(state);
  }

  void addCommand(Command command){
    _addLaterCommandList.add(command);
  }

  void reset(){
    _dinoPlayer.reset();
    _enemyManager.reset();

    children.whereType<Saw>().forEach((element) {
      element.removeFromParent();
    });
  }

}
