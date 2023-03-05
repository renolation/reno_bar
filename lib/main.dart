import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_bar/game/dino_game.dart';
import 'package:reno_bar/providers/appwrite_provider.dart';
import 'package:reno_bar/screens/main_menu.dart';
import 'package:appwrite/appwrite.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/player_data.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client
      .setEndpoint('https://appwrite.renolation.com/v1')
      .setProject('63f8c42eaaa64a25a722')
      .setSelfSigned(status: true);

  //region hive
  await Hive.initFlutter();
  Hive.registerAdapter(PlayerDataAdapter());
  await Hive.openBox('mainApp');
  runApp(
     ProviderScope(
      overrides: [
        appWriteProvider.overrideWithValue(client),
      ],
      child:const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
    );
  }
}
