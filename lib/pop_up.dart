
import 'package:flutter/material.dart';
import 'package:sign_up_page/login_page.dart';

class POPUP extends StatefulWidget {
  const POPUP({super.key});

  @override
  State<POPUP> createState() => _POPUPState();
}

class _POPUPState extends State<POPUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: (){
          showDialog(context: context, builder: (context)=>
            AlertDialog(
              title: Text("POPUP"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return LoginPage();
                  }));
                }, child: Text("ok"),
                )],
            ),
          );
        },
        child: Text("showpopup"),
      ),
    );
  }
}
