import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RolledPage extends StatelessWidget {
  final double height;
  final double horizontalPadding;
  final double padding;
  const RolledPage({
    Key? key,
    required this.height,
    required this.horizontalPadding,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: padding),
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5),
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFFFCC), Colors.white, Color(0xFFFFFFCC)])),
    );
  }
}
