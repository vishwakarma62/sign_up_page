import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/drawer.dart';
import 'package:sign_up_page/forget_password.dart';
import 'package:sign_up_page/sign_up_page.dart';
import 'package:sign_up_page/user_screen.dart';
import 'package:sign_up_page/user_widget.dart';
import 'package:sign_up_page/vanue_selection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final Phone = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isEmail = true;
  bool isPhone = false;
  bool ischeked = false;

  toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/icons/bgnew.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 170,
                        width: 170,
                        child: Image.asset(
                          "assets/giff/outer.gif",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEmail = true;
                                  isPhone = false;
                                });
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50)),
                                  color: isEmail
                                      ? AppColor.blue
                                      : AppColor.lightblue2,
                                ),
                                child: Center(child: Text("Email")),
                              ),
                            ),
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isEmail = false;
                                isPhone = true;
                              });
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                                color: isPhone
                                    ? AppColor.blue
                                    : AppColor.lightblue2,
                              ),
                              child: Center(child: Text("Phone")),
                            ),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    if(isEmail==true)Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          } else {
                            return null;
                          }
                        },
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                                width: 10,
                                height: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      Image.asset("assets/icons/ic_email.png"),
                                )),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                   // SizedBox(height: 20,),
                    if(isPhone==true)Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: IntlPhoneField(
                        controller: Phone,
                        disableLengthCheck: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,
                          fillColor: AppColor.lightblue,
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else {
                            return null;
                          }
                        },
                        controller: password,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                                width: 10,
                                height: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      Image.asset("assets/icons/ic_lock.png"),
                                )),
                            suffixIcon: SizedBox(
                              width: 10,
                              height: 10,
                              child: InkWell(
                                onTap: () {
                                  toggleObscureText();
                                },
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: _obscureText
                                      ? Image.asset("assets/icons/ic_show.png")
                                      : Image.asset("assets/icons/ic_hide.png"),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Checkbox(
                              value: ischeked,
                              onChanged: (newvalue) {
                                setState(() {
                                  ischeked = newvalue!;
                                });
                              }),
                        ),
                        Text("Remenber Me"),
                        SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ForgotPassword();
                              }));
                            },child: Text("Forgot Password?")),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print("sfsdfs");
                            FocusScope.of(context).unfocus();
                            if (formkey.currentState!.validate()) {
                              if (ischeked == false) {
                                Fluttertoast.showToast(
                                    msg: "please agree term and conditions",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    //backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "User Registered",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    //backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              ;
                            }
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(color: AppColor.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: ElevatedButton(
                          onPressed: () {


                            FocusScope.of(context).unfocus();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DrawerPage();
                            }));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: AppColor.blue),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.white,
                            side: BorderSide(width: 2, color: AppColor.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/icons/ic_facebook.png"),
                            backgroundColor: AppColor.white,
                            radius: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/icons/ic_google.png"),
                            backgroundColor: AppColor.white,
                            radius: 22,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Don't have an account?"),
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Drawer();
                          }));
                        },
                          child: Text(
                            "continue as guest",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColor.voilet),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
