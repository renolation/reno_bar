

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reno_bar/game/dino_game.dart';
import 'package:reno_bar/widgets/overlays/pause_button.dart';

import '../../models/player_data.dart';
import '../../screens/main_menu.dart';

class PauseMenu extends StatelessWidget {
  static const String id = 'PauseMenu';
  final DinoGame gameRef;

  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pause menu title.
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              'Paused',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  )
                ],
              ),
            ),
          ),

          // Resume button.
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                gameRef.resumeEngine();
                gameRef.overlays.remove(PauseMenu.id);
                gameRef.overlays.add(PauseButton.id);
              },
              child: const Text('Resume'),
            ),
          ),

          // Restart button.
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () async {
                var mainApp = await Hive.openBox('mainApp');
                if(mainApp.containsKey('player_data')){
                  PlayerData data = mainApp.get('player_data');
                  List<int> highScore = List.from(data.highScore);
                  highScore.add(gameRef.dinoPlayer.score);
                  data.copyWith(
                      score: gameRef.dinoPlayer.score,
                      life: gameRef.dinoPlayer.life,
                      highScore: highScore
                  );
                  print(data.toString());
                  mainApp.put('player_data', data);
                }
                else {
                  PlayerData data = PlayerData(score: gameRef.dinoPlayer.score, life: gameRef.dinoPlayer.life, highScore: []);
                  print(data.toString());
                  mainApp.put('player_data', data);
                }

                gameRef.overlays.remove(PauseMenu.id);
                gameRef.overlays.add(PauseButton.id);
                gameRef.reset();
                gameRef.resumeEngine();
              },
              child: const Text('Restart'),
            ),
          ),

          // Exit button.
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                gameRef.overlays.remove(PauseMenu.id);
                gameRef.reset();
                gameRef.resumeEngine();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MainMenu(),
                  ),
                );
              },
              child: const Text('Exit'),
            ),
          ),
        ],
      ),
    );
  }
}
