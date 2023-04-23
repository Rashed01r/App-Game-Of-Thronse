import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/component/characterItem.dart';
import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/logic/characterProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character>? allCharacter;
  final searchTextController = TextEditingController();
  List<Character>? searchAllCharacter;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    Provider.of<CharacterProvider>(context, listen: false).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CharacterProvider>(context, listen: false);
    double font = MediaQuery.textScaleFactorOf(context);

    Widget buildSearchFiald() {
      return TextField(
        controller: searchTextController,
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          hintText: "find a character...",
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: font * 18,
          ),
        ),
        style: TextStyle(
          color: Colors.yellow,
          fontSize: font * 18,
        ),
        onChanged: (searchedCharacter) {
          addSearchedForItemsToSearchedList(searchedCharacter);
        },
      );
    }

    List<Widget> buildAppBarAction() {
      if (isSearching) {
        return [
          IconButton(
              onPressed: () {
                clearSearch();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.deepOrange,
              ))
        ];
      } else {
        return [
          IconButton(
              onPressed: () {
                ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
                  onRemove: stopSearching,
                ));
                setState(() {
                  isSearching = true;
                });
              },
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ))
        ];
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: isSearching ? buildSearchFiald() : Text("Characters"),
        backgroundColor: Colors.grey[800],
        actions: buildAppBarAction(),
      ),
      body: SafeArea(child: Consumer<CharacterProvider>(
        builder: (context, model, child) {
          allCharacter = provider.characters;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: searchTextController.text.isEmpty
                ? allCharacter!.length
                : searchAllCharacter!.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, i) {
              return CharacterItem(
                  character: searchTextController.text.isEmpty
                      ? allCharacter![i]
                      : searchAllCharacter![i]);
            },
          );
        },
      )),
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchAllCharacter = allCharacter!
        .where((character) =>
            character.fullName!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    searchTextController.clear();
  }
}
