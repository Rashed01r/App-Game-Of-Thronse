import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/data/models.dart';

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
      child: GridTile(
        child: Container(
          color: Colors.grey,
          child: FadeInImage.assetNetwork(
            placeholder: "images/loading.gif",
            image: "${character.imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
        footer: Container(
          width: width,
          height: height / 18,
          color: Colors.black54,
          alignment: Alignment.center,
          child: Text(
            "${character.fullName}",
            style: TextStyle(
              fontSize: font * 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
