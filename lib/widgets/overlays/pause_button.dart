import 'package:flutter/material.dart';
import 'package:reno_bar/widgets/overlays/pause_menu.dart';

import '../../game/dino_game.dart';

class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final DinoGame gameRef;

  const PauseButton({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextButton(
          child: const Icon(
            Icons.pause_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            gameRef.pauseEngine();
            gameRef.overlays.add(PauseMenu.id);
            gameRef.overlays.remove(PauseButton.id);
          },
        ),
      ),
    );
  }
}
