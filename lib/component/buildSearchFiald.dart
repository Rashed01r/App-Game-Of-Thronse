import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/logic/characterProvider.dart';
import 'package:provider/provider.dart';

class BuildSearchFiald extends StatelessWidget {
  const BuildSearchFiald({super.key});

  @override
  Widget build(BuildContext context) {
    double font = MediaQuery.textScaleFactorOf(context);
    var provider = Provider.of<CharacterProvider>(context, listen: false);

    return TextField(
      controller: provider.searchTextController,
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
        provider.addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
    ;
  }
}
