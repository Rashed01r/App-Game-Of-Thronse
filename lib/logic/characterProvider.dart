import 'package:flutter/material.dart';
import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/data/repository.dart';

class CharacterProvider extends ChangeNotifier {
  final Repository repository;
  List<Character> characters = [];
  final searchTextController = TextEditingController();
  List<Character> searchAllCharacter = [];
  bool isSearching = false;

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

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchAllCharacter = characters
        .where((character) =>
            character.fullName!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    notifyListeners();
  }

  void stopSearching() {
    clearSearch();
    isSearching = false;
    notifyListeners();
  }

  void clearSearch() {
    searchTextController.clear();
    notifyListeners();
  }

  List<Widget> buildAppBarAction(BuildContext context) {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Colors.red,
          ),
        )
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
                onRemove: stopSearching,
              ));

              isSearching = true;
              notifyListeners();
            },
            icon: Icon(
              Icons.search,
              color: Color(0xff536DFE),
            ))
      ];
    }
  }
}
