import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_bar/providers/appwrite_provider.dart';
import 'package:reno_bar/screens/game_play.dart';

class MainMenu extends HookConsumerWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientProvider = ref.watch(appWriteProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const GamePlay()));
            }, child: const Text('Play')),
            ElevatedButton(onPressed: () async {

              var mainApp = await Hive.openBox('mainApp');
              if(mainApp.containsKey('player_data')){
                print('true');
                print(mainApp.get('player_data').toString());
              } else {
                print('false');
              }

              // Account account = Account(clientProvider);
              //
              // final user = await account.create(
              //     userId: ID.unique(),
              //     email: 'me@appwrite.io',
              //     password: 'password',
              //     name: 'My Name'
              // );
            }, child: const Text('Options')),
          ],
        ),
      ),
    );
  }
}
