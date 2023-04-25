import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/component/silverAppBar.dart';
import 'package:game_of_thrones/component/silverList.dart';
import 'package:game_of_thrones/data/models.dart';

class DetalisCharacter extends StatelessWidget {
  final Character character;
  const DetalisCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: CustomScrollView(
        slivers: [
          SilverBar(character: character),
          SilverListCharacter(character: character)
        ],
      ),
    );
  }
}
