import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/login_page.dart';

import 'bottomnavigationbar.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({
    super.key,
  });

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

bool isSwitched = false;

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
              child: Container(
                color: Colors.green,
                child: Text(
                  "Online Data",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return BottomNavigation(
                    index: 0,
                  );
                }));
              },
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: const Text("Home data"),
                trailing: Text(""),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return BottomNavigation(
                    index: 1,
                  );
                }));
              },
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: const Text("Album data"),
                trailing: Text(""),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return BottomNavigation(
                    index: 2,
                  );
                }));
              },
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: const Text("Post data"),
                trailing: Text(""),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: const Text("Album data"),
                trailing: Text(""),
              ),
            ),
            GestureDetector(
              onTap: () {
                _deletearticle(context);
              },
              child: ListTile(
                leading: const Icon(Icons.data_object),
                title: const Text("LogOut"),
                trailing: Text(""),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deletearticle(BuildContext context) {
    showModalBottomSheet(
        context: (context),
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            //height: 105,
            color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 20),
                  child: Text(
                    "Are you sure you want to sign out?",
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            },
                            child: Text(
                              "Confirm",
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
