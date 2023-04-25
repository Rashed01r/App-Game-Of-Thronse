import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BuildNoInternet extends StatelessWidget {
  const BuildNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double font = MediaQuery.textScaleFactorOf(context);
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: height / 5,
            ),
            Text(
              "Can\'t connect .. check internet",
              style: TextStyle(
                color: Colors.black,
                fontSize: font + 17,
              ),
            ),
            Image.asset("images/undraw_Warning_re_eoyh (2).png"),
          ],
        ),
      ),
    );
  }
}
