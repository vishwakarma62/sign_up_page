
// import 'package:flutter/material.dart';
// import 'package:sign_up_page/user.dart';

// class UserWidget extends StatefulWidget {
//     UserWidget({super.key,required this.user});
//     User user;

//   @override
//   State<UserWidget> createState() => _UserWidgetState();
// }

// class _UserWidgetState extends State<UserWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 300,
//       height: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             //child: Image.asset("${widget.user.imgUrl}",fit: BoxFit.fill,),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.green,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Text("name:"),
//                     SizedBox(height: 10,),
//                     Text("${widget.user.name}"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("username"),
//                     SizedBox(height: 10,),
//                     Text("${widget.user.Username}"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("Phone:"),
//                     Text("${widget.user.Phone}"),
//                   ],
//                 ),

//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
