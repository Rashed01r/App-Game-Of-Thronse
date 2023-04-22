import 'package:flutter/material.dart';
import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/data/repository.dart';

class CharacterProvider extends ChangeNotifier {
  final Repository repository;
  List<Character> characters = [];

  CharacterProvider({required this.repository});
  List<Character> getCharacters() {
    repository.getCharacters().then(
      (models) {
        this.characters = models;
        notifyListeners();
      },
    );
    return characters;
  }
}
