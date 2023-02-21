import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:reno_bar/widgets/overlays/game_over_menu.dart';
import 'package:reno_bar/widgets/overlays/pause_button.dart';
import 'package:reno_bar/widgets/overlays/pause_menu.dart';

import '../dino_game.dart';
 DinoGame _dinoGame = DinoGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: ()async => false,
          child: GameWidget(game: _dinoGame,
            initialActiveOverlays: const [PauseButton.id],
            overlayBuilderMap: {
            PauseButton.id:(BuildContext context, DinoGame gameRef) => PauseButton(gameRef: gameRef),
             PauseMenu.id: (BuildContext context, DinoGame gameRef) => PauseMenu(gameRef: gameRef),
             GameOverMenu.id: (BuildContext context, DinoGame gameRef) => GameOverMenu(gameRef: gameRef),
            },
          )),
    );
  }
}
