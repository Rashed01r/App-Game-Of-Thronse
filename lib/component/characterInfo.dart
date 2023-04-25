import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CharacterInfo extends StatelessWidget {
  String title;
  String value;
  CharacterInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double font = MediaQuery.textScaleFactorOf(context);

    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                color: Colors.white,
                fontSize: font * 17,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: value,
              style: TextStyle(
                color: Colors.white,
                fontSize: font * 15,
              ))
        ]));
  }
}
