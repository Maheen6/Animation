import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurningPaper extends StatefulWidget {
  BurningPaper({
    this.color = Colors.white,
    this.duration = const Duration(seconds: 3),
    this.pointAmount = 30
  });

  final Color color;
  final Duration duration;
  final int pointAmount;

  @override
  _BurningPaperState createState() => _BurningPaperState();
}

class _BurningPaperState extends State<BurningPaper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late List<double> points;

  @override
  void initState() {
    super.initState();
    // Here we need to initialize everything
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Here we need to add the painter to the widget tree
    return Container();
  }
}