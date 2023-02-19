import 'package:flutter/material.dart';
import 'package:reno_bar/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const GamePlay()));
            }, child: const Text('Play')),
            ElevatedButton(onPressed: (){}, child: const Text('Options')),
          ],
        ),
      ),
    );
  }
}
