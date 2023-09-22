import 'package:flutter/material.dart';
import 'package:sign_up_page/Appcolor.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("Drawer"),
        ),
        body: Center(
            child: Text(
          'A drawer is an invisible side screen.',
          style: TextStyle(fontSize: 20.0),
        )),
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Atul Vishwakarma"),
              accountEmail: Text("vishwakarmaatul9316@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/ic_profile.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Message"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Calender"),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Bookmark"),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Contact Us"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Helps & FAQs"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
            ),
          ],
        )));
  }
}
