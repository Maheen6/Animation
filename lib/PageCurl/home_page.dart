import 'package:animation/PageCurl/page_turn_effect.dart';
import 'package:animation/PageCurl/page_turn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alice_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.5,
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller?.status == AnimationStatus.dismissed ||
        _controller?.status == AnimationStatus.reverse) {
      _controller?.forward();
    } else {
      _controller?.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('title'),
      ),
      body: Material(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const PageTurnImage(
                amount: AlwaysStoppedAnimation(1.0),
                image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/John_Masefield.djvu/page10-1024px-John_Masefield.djvu.jpg',
                ),
              ),
              PageTurnWidget(
                amount: _controller!,
                child: const AlicePage(),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                height: 48.0,
                child: AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, child) {
                    return Slider(
                      value: _controller!.value,
                      onChanged: (double value) {
                        _controller?.value = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}