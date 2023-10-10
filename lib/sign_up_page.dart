import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/Bloc/signupbloc/bloc/sign_up_bloc.dart';
import 'package:sign_up_page/login_page.dart';
import 'package:sign_up_page/model%20copy/authmodel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final email = TextEditingController();
  final usernama = TextEditingController();
  final password = TextEditingController();
  final Phone = TextEditingController();
  final ConfirmPassword = TextEditingController();
  final Refferal = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool _obscureText = false;
  bool ischeked = false;
  toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpLoading) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue.withOpacity(0.6),
                  content: Text("loading..")));
            }
            if (state is SignUpErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue.withOpacity(0.6),
                  content: Text("${state.error}")));
            }
            if (state is SignUponNoInternet) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue.withOpacity(0.6),
                  content: Text("${state.net}")));
            }
            if (state is SignUpLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue.withOpacity(0.6),
                  content: Text("${state.masg}")));
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            }
          },
          builder: (context, state) {
            return Column(
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
                                "assets/icons/newlogo.png",
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
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')), // Deny whitespace (spaces)
                              ],
                              // onChanged: _updateNameValidity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter name";
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              controller: usernama,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Icon(
                                        Icons.person_2_outlined,
                                        color: AppColor.blue,
                                      ),
                                    )),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                hintText: "username",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')), // Deny whitespace (spaces)
                              ],
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'Enter email';
                                }

                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                          "assets/icons/ic_email.png"),
                                    )),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                hintText: "Enter Email",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: IntlPhoneField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              controller: Phone,
                              disableLengthCheck: true,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                labelText: 'Phone Number',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                                filled: true,
                                fillColor: AppColor.lightblue,
                              ),
                              initialCountryCode: 'IN',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              controller: password,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')), // Deny whitespace (spaces)
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter password";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                          "assets/icons/ic_lock.png"),
                                    )),
                                suffixIcon: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: InkWell(
                                    onTap: () {
                                      toggleObscureText();
                                    },
                                    child: Transform.scale(
                                      scale: 0.56,
                                      child: _obscureText
                                          ? Image.asset(
                                              "assets/icons/ic_show.png")
                                          : Image.asset(
                                              "assets/icons/ic_hide.png"),
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                hintText: "Enter Password",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')), // Deny whitespace (spaces)
                              ],
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
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                          "assets/icons/ic_lock.png"),
                                    )),
                                suffixIcon: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: InkWell(
                                    onTap: () {
                                      toggleObscureText();
                                    },
                                    child: Transform.scale(
                                      scale: 0.56,
                                      child: _obscureText
                                          ? Image.asset(
                                              "assets/icons/ic_show.png")
                                          : Image.asset(
                                              "assets/icons/ic_hide.png"),
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                hintText: "Conform Password",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.4),
                              controller: Refferal,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                prefixIcon: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                          "assets/icons/ic_referal_code.png"),
                                    )),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                hintText: "Refferal Code",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(width: 1.2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(width: 1.2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Checkbox(
                                      value: ischeked,
                                      onChanged: (newvalue) {
                                        setState(() {
                                          ischeked = newvalue!;
                                        });
                                      }),
                                ),
                                Text("I Agree"),
                                Text(
                                  "Terms and Conditions",
                                  style: TextStyle(color: AppColor.voilet),
                                ),
                                Text("&"),
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(color: AppColor.voilet),
                                ),
                              ],
                            ),
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
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  if (formkey.currentState!.validate()) {
                                    if (ischeked == true) {
                                      if (password.text ==
                                          ConfirmPassword.text) {
                                        context.read<SignUpBloc>()
                                          ..add(SignUPSubmitEvent(
                                              signup: AuthModel(
                                                  email: email.text,
                                                  username: usernama.text,
                                                  password:
                                                      ConfirmPassword.text)));
                                        Fluttertoast.showToast(
                                            msg: "signup successfull",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            //backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else {
                                        password.clear();
                                        ConfirmPassword.clear();
                                        Fluttertoast.showToast(
                                            msg: "password are missmatch",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            //backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              "please agree term and conditions",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          //backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
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
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have on account?"),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: AppColor.voilet),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
