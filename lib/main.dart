import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FlipPage/flip_page.dart';

///PageRoll
import 'package:animation/RolledPage/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF48fb1),
        hintColor: Colors.pinkAccent,
      ),
      home: HomeView(),
    ),
  );
}




///BurningPage
// import 'package:animation/RolledPage/home_view.dart';
// import 'package:flutter/material.dart';
//
// import 'BurningPaper/burning_paper.dart';
//
//
// void main(){
//    runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                       colors: [Colors.orange, Colors.orangeAccent]
//                   )
//               ),
//               child: Center(
//                   child: Text(
//                     "Burning\nPaper\nEffect",
//                     style: TextStyle(fontSize: 48, color: Colors.white),
//                     textAlign: TextAlign.center,
//                   )
//               ),
//             ),
//             IgnorePointer(
//                 child:BurningPaper(
//                   //color: Theme.of(context).accentColor
//                 )
//             )
//           ]
//       ),
//     );
//   }
// }


///Page Turn
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import 'FlipPage/flip_page.dart';
// import 'PageCurl/home_page.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.indigo,
//         hintColor: Colors.pinkAccent,
//       ),
//       home: MyHomePage(),
//     ),
//   );
// }



///FlipPage
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FlipBookExample(),
//     );
//   }
// }





//
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Custom Flip Book',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FlipBookPage(),
//     );
//   }
// }
//
// class FlipBookPage extends StatefulWidget {
//   @override
//   _FlipBookPageState createState() => _FlipBookPageState();
// }
//
// class _FlipBookPageState extends State<FlipBookPage> {
//   final PageController _pageController = PageController();
//   double _dragOffset = 0.0;
//   bool _isDragging = false;
//
//   final List<Widget> _pages = [
//     Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.blue,
//       child: Center(
//         child: Text(
//           'Page 1',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//       ),
//     ),
//     Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.green,
//       child: Center(
//         child: Text(
//           'Page 2',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//       ),
//     ),
//     Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.red,
//       child: Center(
//         child: Text(
//           'Page 3',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//       ),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Custom Flip Book')),
//       body: PageView.builder(
//         controller: _pageController,
//         itemCount: _pages.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onPanStart: (details) {
//               if (details.localPosition.dx > MediaQuery.of(context).size.width - 50 &&
//                   details.localPosition.dy < 50) {
//                 _isDragging = true;
//               }
//             },
//             onPanUpdate: (details) {
//               if (_isDragging) {
//                 setState(() {
//                   _dragOffset = details.localPosition.dx;
//                 });
//               }
//             },
//             onPanEnd: (details) {
//               if (_isDragging) {
//                 if (_dragOffset > MediaQuery.of(context).size.width / 2) {
//                   if (index < _pages.length - 1) {
//                     _pageController.nextPage(
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.easeInOut,
//                     );
//                   }
//                 }
//                 setState(() {
//                   _dragOffset = 0.0;
//                   _isDragging = false;
//                 });
//               }
//             },
//             child: Stack(
//               children: [
//                 _pages[index],
//                 if (_isDragging && _dragOffset > 0)
//                   Positioned.fill(
//                     child: CustomPaint(
//                       painter: PageFoldPainter(dragOffset: _dragOffset),
//                     ),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PageFoldPainter extends CustomPainter {
//   final double dragOffset;
//
//   PageFoldPainter({required this.dragOffset});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey.withOpacity(0.8)
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     path.moveTo(size.width, 0);
//     path.lineTo(size.width - dragOffset, dragOffset);
//     path.lineTo(size.width, dragOffset);
//     path.lineTo(size.width, 0);
//     path.close();
//
//     canvas.drawPath(path, paint);
//
//     final shadowPaint = Paint()
//       ..color = Colors.black.withOpacity(0.3)
//       ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0);
//
//     final shadowPath = Path();
//     shadowPath.moveTo(size.width, 0);
//     shadowPath.lineTo(size.width - dragOffset, dragOffset);
//     shadowPath.lineTo(size.width, dragOffset);
//     shadowPath.lineTo(size.width, 0);
//     shadowPath.close();
//
//     canvas.drawPath(shadowPath, shadowPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
