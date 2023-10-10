import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/Bloc/login/bloc/login_bloc.dart';
import 'package:sign_up_page/drawer.dart';
import 'package:sign_up_page/event_screen_.dart';
import 'package:sign_up_page/forget_password.dart';
import 'package:sign_up_page/model%20copy/authmodel.dart';
import 'package:sign_up_page/sign_up_page.dart';
import 'package:sign_up_page/ui/bottomnavigationbar.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue,
                  content: Text("loading...")));
            }
            if (state is LoginLoadedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue,
                  content: Text("${state.msg}")));
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return BottomNavigation(index: 0);
              }));
            }
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue,
                  content: Text("${state.error}")));
            }
            if (state is LoginNoInternetState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColor.blue,
                  content: Text("${state.net}")));
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
                          SizedBox(
                            height: 20,
                          ),
                          if (isEmail == true)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorColor: AppColor.blue,
                                style: TextStyle(
                                    fontSize: 13.5, letterSpacing: 0.6),
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(
                                      r'\s')), // Deny whitespace (spaces)
                                ],
                                validator: (value) {
                                  // Check if this field is empty
                                  if (value == null || value.isEmpty) {
                                    return 'Enter email';
                                  }

                                  // using regular expression
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
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
                                      vertical: 1, horizontal: 12),
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
                          // SizedBox(height: 20,),
                          if (isPhone == true)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: IntlPhoneField(
                                cursorColor: AppColor.blue,
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              cursorColor: AppColor.blue,
                              style:
                                  TextStyle(fontSize: 13.5, letterSpacing: 0.6),
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
                              controller: password,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.emailAddress,
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
                                    highlightColor: Colors.transparent,
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () {
                                      toggleObscureText();
                                    },
                                    child: Transform.scale(
                                        scale: 0.56,
                                        child: _obscureText
                                            ? Image.asset(
                                                "assets/icons/ic_hide.png")
                                            : Image.asset(
                                                "assets/icons/ic_show.png")),
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
                            height: 12,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.5),
                            child: Row(
                              children: [
                                Checkbox(
                                    value: ischeked,
                                    onChanged: (newvalue) {
                                      setState(() {
                                        ischeked = newvalue!;
                                      });
                                    }),
                                Text("Remenber Me"),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ForgotPassword();
                                      }));
                                    },
                                    child: Text("Forgot Password?")),
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
                                    if (ischeked == false) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "please agree term and conditions",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          //backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      context.read<LoginBloc>()
                                        ..add(LoginsubmitEvent(
                                            requestModel: AuthModel(
                                                email: email.text,
                                                password: password.text)));
                                    }
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
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  FocusScope.of(context).unfocus();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpPage();
                                  }));
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(color: AppColor.blue),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.white,
                                  side: BorderSide(
                                      width: 2, color: AppColor.blue),
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
                                  backgroundImage: AssetImage(
                                      "assets/icons/ic_facebook.png"),
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
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
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
