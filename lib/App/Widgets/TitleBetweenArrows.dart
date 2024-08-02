import 'package:flutter/material.dart';
import 'package:meetswap/Constant/ImagesPath.dart';

class TitleBetweenArrows extends StatelessWidget {
  const TitleBetweenArrows(
      {super.key,
      required this.child,
      required this.title,
      this.textcolor = Colors.black});
  final Widget child;
  final String title;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImagesPath.continueWithleft),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: textcolor),
            ),
            child,
          ],
        ),
        Image.asset(AppImagesPath.continueWithright),
      ],
    );
  }
}
