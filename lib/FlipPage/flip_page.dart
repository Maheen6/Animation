// import 'package:flutter/material.dart';
// import 'package:flip_widget/flip_widget.dart';
//
//
// class FlipBookExample extends StatefulWidget {
//   @override
//   _FlipBookExampleState createState() => _FlipBookExampleState();
// }
//
// class _FlipBookExampleState extends State<FlipBookExample> {
//   bool isFront = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flip Book Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isFront = !isFront;
//                   });
//                 },
//                 child: FlipWidget(
//                   front: Container(
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(
//                         'Page 1',
//                         style: TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   back: Container(
//                     color: Colors.green,
//                     child: Center(
//                       child: Text(
//                         'Page 2',
//                         style: TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   isFront: isFront,
//                   duration: Duration(milliseconds: 800),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     isFront = !isFront;
//                   });
//                 },
//                 child: Text('Flip Page'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
