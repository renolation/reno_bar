import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../dino_game.dart';
 DinoGame _dinoGame = DinoGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async => false,
        child: GameWidget(game: _dinoGame));
  }
}
