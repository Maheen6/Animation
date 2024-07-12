import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;
  final double height;

  const TitleView({Key? key,
    required this.title,
    required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Container(
          alignment: Alignment.center,
          height: height,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),

          ),



        )

        );
  }
}
