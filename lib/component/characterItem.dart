import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/data/models.dart';
import 'package:game_of_thrones/view/detalisCharacter.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double font = MediaQuery.textScaleFactorOf(context);

    return Container(
      width: width,
      margin: EdgeInsets.only(
          top: top + 8, bottom: bottom + 8, left: left + 8, right: right + 8),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetalisCharacter(
              character: character,
            ),
          ));
        },
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: Colors.grey,
              child: FadeInImage.assetNetwork(
                placeholder: "images/97952-loading-animation-blue.gif",
                image: "${character.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: Container(
            height: height / 18,
            color: Colors.black54,
            alignment: Alignment.center,
            child: Text(
              "${character.fullName}",
              style: TextStyle(
                fontSize: font * 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
