
// import 'package:flutter/material.dart';
// import 'package:sign_up_page/user.dart';
// import 'package:sign_up_page/user_widget.dart';

// class UserScreen extends StatefulWidget {
//    const UserScreen({super.key,});


//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   List<User> userlist=[
//     User(
//         id: "1",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//   Username: "atul@9316",
//   name: "Atul",
//   imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//   Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Aman",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Alok",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),
//     User(id: "2",
//         Username: "atul@9316",
//         name: "Atul",
//         imgUrl: "assets/images/Wallpapers-For-Phone.jpg",
//         Phone: 9316102172, Address: "210 Ahemedabad street no 4, maninagar"),

//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Expanded(
//           child: ListView.separated(itemBuilder: (context,index){
//             return UserWidget(user: userlist[index]);
//           }, separatorBuilder: (context,index){
//             return SizedBox(height: 10,);
//           }, itemCount: userlist.length),
//         ),
//       ),
//     );
//   }
// }
