// import 'package:ant_icons/ant_icons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red.shade800,
//           title: Text('Dashboard'),
//         ),
//         body: Container(
//           color: Colors.white,
//           child: Column(
//             children: [
//               Container(
//                 child: GridView.count(
//                   crossAxisCount: 3,
//                   childAspectRatio: 3.5,
//                   mainAxisSpacing: 20.0,
//                   crossAxisSpacing: 20.0,
//                   padding: EdgeInsets.all(02.0),
//                   shrinkWrap: true,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 3, color: Colors.red.shade800)),
//                       child: Material(
//                         elevation: 02.0,
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Container(
//                           color: Colors.white,
//                           height: 120.0,
//                           padding: EdgeInsets.all(0.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             'Mobile App Development',
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             '70',
//                                             style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 120.0,
//                                 height: 120.0,
//                                 child: Icon(
//                                   AntIcons.book_outline,
//                                   size: 50.0,
//                                   color: Colors.red.shade800,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 3, color: Colors.red.shade800)),
//                       child: Material(
//                         elevation: 02.0,
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Container(
//                           color: Colors.white,
//                           height: 120.0,
//                           padding: EdgeInsets.all(0.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             'Algorithms Design & Analysis',
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             '65',
//                                             style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 120.0,
//                                 height: 120.0,
//                                 child: Icon(
//                                   AntIcons.book_outline,
//                                   size: 50.0,
//                                   color: Colors.red.shade800,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 3, color: Colors.red.shade800)),
//                       child: Material(
//                         elevation: 02.0,
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Container(
//                           color: Colors.white,
//                           height: 120.0,
//                           padding: EdgeInsets.all(0.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             'Software Engineering',
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             '80',
//                                             style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 120.0,
//                                 height: 120.0,
//                                 child: Icon(
//                                   AntIcons.book_outline,
//                                   size: 50.0,
//                                   color: Colors.red.shade800,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 3, color: Colors.red.shade800)),
//                       child: Material(
//                         elevation: 02.0,
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Container(
//                           color: Colors.white,
//                           height: 120.0,
//                           padding: EdgeInsets.all(0.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             'Leadership',
//                                             style: TextStyle(
//                                                 fontSize: 15.0,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             '90',
//                                             style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 120.0,
//                                 height: 120.0,
//                                 child: Icon(
//                                   AntIcons.book_outline,
//                                   size: 50.0,
//                                   color: Colors.red.shade800,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(width: 3, color: Colors.red.shade800)),
//                       child: Material(
//                         elevation: 02.0,
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Container(
//                           color: Colors.white,
//                           height: 120.0,
//                           padding: EdgeInsets.all(0.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             'Research Methods',
//                                             style: TextStyle(
//                                                 fontSize: 15.0,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 15.0),
//                                           child: Text(
//                                             '70',
//                                             style: TextStyle(
//                                                 fontSize: 30.0,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: Colors.red.shade800),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 width: 120.0,
//                                 height: 120.0,
//                                 child: Icon(
//                                   AntIcons.book_outline,
//                                   size: 50.0,
//                                   color: Colors.red.shade800,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
