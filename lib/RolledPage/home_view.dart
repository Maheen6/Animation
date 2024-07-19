import 'package:animation/RolledPage/build_page.dart';
import 'package:animation/RolledPage/title_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'title_view.dart';
import 'rolled_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _controller;

  final double _titleViewHeight = 100;

  final double _pageHeight = 600;

  final double _horizontalPadding = 32;

  final double _bottomPadding = 16;

  final int _totalPages = 4;

  double _scrollOffset = 0.0;

  bool _scrollingUp = true;

  double _currentPageCount = 1;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        final offset = _controller.offset;
        if (offset >= 0.0 &&
            offset <= _totalPages * (_pageHeight + _bottomPadding)) {
          if (_scrollingUp) {
            decrementPageCount(offset);
          } else if (!_scrollingUp) {
            incrementPageCount(offset);
          }
          setState(() {
            _scrollOffset = _controller.offset;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final double topPadding = mediaQueryData.padding.top;
    final double deviceHeight = mediaQueryData.size.height;
    final scrollViewPadding = deviceHeight - (topPadding + _titleViewHeight);
    print(_currentPageCount);
    return Scaffold(
      backgroundColor: Color(0xFFF48fb1),
      body: Column(children: [
        TitleView(
          title: "Paper roll scroll",
          height: _titleViewHeight,
        ),
        ...List.generate(_totalPages, (index) {
          return RolledPage(
            height: _rolledPageHeight(index),
            horizontalPadding: _horizontalPadding,
            padding: _rolledPageTopPadding(index),
          );
        }),
        Expanded(
          child: NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              if (notification.direction == ScrollDirection.forward) {
                _scrollingUp = true;
              } else if (notification.direction == ScrollDirection.reverse) {
                _scrollingUp = false;
              }
              return true;
            }),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  ...List.generate(4, (index) {
                    return BuildPage(
                        height: _pageHeight,
                        horizontalPadding: _horizontalPadding,
                        bottomPadding: _bottomPadding);
                  }),
                  SizedBox(
                    height: scrollViewPadding,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  double _rolledPageHeight(int index) {
    final pageHeight = _pageHeight + _bottomPadding;
    if (_currentPageCount < index + 1) {
      return 0;
    } else if (_currentPageCount > index + 1) {
      return 0.04 * pageHeight;
    } else if (_currentPageCount == index + 1) {
      return 0.04 * (_scrollOffset - ((_currentPageCount - 1) * pageHeight));
    } else {
      return 0;
    }
  }

  double _rolledPageTopPadding(int index) {
    if (_currentPageCount < index + 1) {
      return 0;
    } else if (_currentPageCount > index + 1) {
      return 0.04;
    } else if (_currentPageCount == index + 1) {
      return 0.04;
    } else {
      return 0;
    }
  }

  void decrementPageCount(double offset) {
    if (offset <= (_currentPageCount - 1) * (_pageHeight + _bottomPadding) &&
        offset > 0.0) {
      _currentPageCount--;
    }
  }

  void incrementPageCount(double offset) {
    if (offset <= _currentPageCount * (_pageHeight + _bottomPadding)) {
      // _currentPageCount++;
    }else{
      _currentPageCount++;

    }
  }
}
