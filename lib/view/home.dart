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
  @override
  void initState() {
    super.initState();
    Provider.of<CharacterProvider>(context, listen: false).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CharacterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
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
            itemCount: allCharacter!.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, i) {
              return CharacterItem(character: allCharacter![i]);
            },
          );
        },
      )),
    );
  }
}
