import 'dart:math';

import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  double endIndent;
  BuildDivider({super.key, required this.endIndent});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Divider(
      color: Colors.yellow,
      height: height / 50,
      endIndent: endIndent,
      thickness: 3,
    );
  }
}
