import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:game_of_thrones/component/buildNoInternet.dart';
import 'package:game_of_thrones/component/buildSearchFiald.dart';
import 'package:game_of_thrones/component/characterItem.dart';
import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/logic/characterProvider.dart';
import 'package:game_of_thrones/view/detalisCharacter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character>? allCharacter;

  @override
  void initState() {
    super.initState();
    Provider.of<CharacterProvider>(context, listen: false).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CharacterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: provider.isSearching ? BuildSearchFiald() : Text("Characters"),
        backgroundColor: Colors.grey[800],
        actions: provider.buildAppBarAction(context),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return SafeArea(
              child: Consumer<CharacterProvider>(
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
                    itemCount: provider.searchTextController.text.isEmpty
                        ? allCharacter!.length
                        : provider.searchAllCharacter.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CharacterItem(
                          character: provider.searchTextController.text.isEmpty
                              ? allCharacter![i]
                              : provider.searchAllCharacter[i]);
                    },
                  );
                },
              ),
            );
          } else {
            return BuildNoInternet();
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
