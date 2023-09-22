
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_up_page/Appcolor.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final Phone = TextEditingController();
  final ConfirmPassword = TextEditingController();
  final Refferal = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _obscureText=false;
  bool ischeked=false;
  toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        ),
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
                  Container(
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
                  SizedBox(height: 20,),
                  Container(
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
                  SizedBox(height: 20,),
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
                  SizedBox(height: 20,),
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
                      controller: ConfirmPassword,
                      obscureText: _obscureText,
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
                          hintText: "Conform Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      controller: Refferal,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: SizedBox(
                              width: 10,
                              height: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                Image.asset("assets/icons/ic_referal_code.png"),
                              )),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          hintText: "Refferal Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Text("I Agree"),
                        Text("Terms and Conditions",style: TextStyle(color: AppColor.voilet),),
                        Text("&"),
                        Text("Privacy Policy",style: TextStyle(color: AppColor.voilet),),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 400,
                    height: 45,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: ElevatedButton(
                        onPressed: () {
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
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Sign Up Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                //backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: AppColor.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have on account?"),
                      SizedBox(width: 8,),
                      GestureDetector(onTap:(){
                        Navigator.pop(context);
                      },child: Text("Login", style: TextStyle(color: AppColor.voilet),)),
                    ],
                  ),
                  SizedBox(height: 25,)
                ],
              ),
            ),

          ),
          ),
        ],
      ),
    );
  }
}
