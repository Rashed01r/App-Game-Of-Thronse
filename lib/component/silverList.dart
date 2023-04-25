import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:game_of_thrones/component/buildDivider.dart';
import 'package:game_of_thrones/component/characterInfo.dart';
import 'package:game_of_thrones/data/models.dart';

class SilverListCharacter extends StatelessWidget {
  final Character character;

  const SilverListCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double font = MediaQuery.textScaleFactorOf(context);
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        margin:
            EdgeInsets.only(right: right + 14, left: left + 14, top: top + 14),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterInfo(
                title: "First name : ", value: "${character.firstName}"),
            BuildDivider(endIndent: width / 1.5),
            SizedBox(
              height: height / 50,
            ),
            CharacterInfo(
                title: "Last name : ", value: "${character.lastName}"),
            BuildDivider(endIndent: width / 1.7),
            SizedBox(
              height: height / 50,
            ),
            CharacterInfo(
                title: "Family name : ", value: "${character.family}"),
            BuildDivider(endIndent: width / 1.4),
            SizedBox(
              height: height / 50,
            ),
            CharacterInfo(title: "Title : ", value: "${character.title}"),
            BuildDivider(endIndent: width / 1.8),
          ],
        ),
      )
    ]));
  }
}
