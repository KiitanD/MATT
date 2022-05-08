// import 'package:ant_icons/ant_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_webmatt/studenthome.dart';
//
// class StudentSideBar extends StatelessWidget {
//   const StudentSideBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250.0,
//       color: Colors.red.shade800,
//       child: ListView(
//         children: [
//           Container(
//             height: 60.0,
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.only(left: 15.0, top: 08.0),
//             child: Row(
//               children: [
//                 Icon(
//                   AntIcons.schedule_outline,
//                   size: 50.0,
//                   color: Colors.white,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 05.0, top: 08.0),
//                   child: Text(
//                     'MATT',
//                     style: TextStyle(fontSize: 30, color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.0,
//           ),
//           Container(
//             child: TextButton(
//               // style: ElevatedButton.styleFrom(
//               //     shape: new RoundedRectangleBorder(
//               //         borderRadius: new BorderRadius.circular(0.0)),
//               //     padding: EdgeInsets.all(18.0)),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => StudentHomepage()));
//               },
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
//                     child: Icon(
//                       AntIcons.dashboard_outline,
//                       size: 23.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 02.0, right: 20.0, bottom: 0.0),
//                     child: Text(
//                       'Dashboard',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             child: TextButton(
//               // style: ElevatedButton.styleFrom(
//               //     shape: new RoundedRectangleBorder(
//               //         borderRadius: new BorderRadius.circular(0.0)),
//               //     padding: EdgeInsets.all(18.0)),
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (context) => StudentTable()));
//               },
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
//                     child: Icon(
//                       AntIcons.table,
//                       size: 23.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 02.0, right: 20.0, bottom: 0.0),
//                     child: Text(
//                       'Timetable',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             child: TextButton(
//               // style: ElevatedButton.styleFrom(
//               //     shape: new RoundedRectangleBorder(
//               //         borderRadius: new BorderRadius.circular(0.0)),
//               //     padding: EdgeInsets.all(18.0)),
//               onPressed: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (context) => StudentHomepage()));
//               },
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
//                     child: Icon(
//                       AntIcons.calendar_outline,
//                       size: 23.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: 15.0, top: 02.0, right: 20.0, bottom: 0.0),
//                     child: Text(
//                       'Enrollment',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
