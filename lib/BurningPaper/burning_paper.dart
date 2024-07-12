import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'burning_paper_painter.dart';

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

    points = [for (var i = 0; i < widget.pointAmount; i+=1) 0];

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();

    _controller.addListener(() {
      setState(() {
        for(int i = 0; i < points.length; i++) {
          double newRandomPoint = points[i] + Random().nextDouble() * _animation.value * 100;
          points[i] = newRandomPoint + _animation.value / 2;
        }
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Here we need to add the painter to the widget tree
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
            painter: BurningPaperPainter(
                color: widget.color,
                points: points
            )
        )
    );
  }
}