import 'package:flutter/material.dart';
import 'package:game_of_thrones/data/models.dart';

class SilverBar extends StatelessWidget {
  final Character character;
  const SilverBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      foregroundColor: Colors.red,
      expandedHeight: height / 1.23,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey[700],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${character.fullName}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
            tag: character.id,
            child: Image.network(
              "${character.imageUrl}",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
