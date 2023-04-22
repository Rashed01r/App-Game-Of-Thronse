import 'package:flutter/material.dart';
import 'package:game_of_thrones/data/repository.dart';
import 'package:game_of_thrones/data/webService.dart';
import 'package:game_of_thrones/logic/characterProvider.dart';
import 'package:game_of_thrones/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CharacterProvider(repository: Repository(webService: WebService())),
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
