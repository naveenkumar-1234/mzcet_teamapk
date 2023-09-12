// import 'package:demo/model/user.dart';
// import 'package:flutter/material.dart';

// class InnerPage extends StatefulWidget {
//   const InnerPage({super.key});

//   @override
//   State<InnerPage> createState() => _InnerPageState();
// }

// class _InnerPageState extends State<InnerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//     );

//     void showDetails(BuildContext context, User user) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return Center(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height / 1,
//                 child: Container(
//                   child: AlertDialog(
//                     title: Text(user.teamName),
//                     content: Column(
//                       children: [Text(user.techquest_id.toString())],
//                     ),
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("Back"))
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           });
//     }
//   }
// }
