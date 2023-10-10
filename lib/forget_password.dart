import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sign_up_page/Appcolor.dart';
import 'package:sign_up_page/login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var phone = TextEditingController();
  bool isEmail = false;
  bool isPhone = true;

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
                            "assets/icons/newlogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Forgot password",
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
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print("email");
                                setState(() {
                                  isEmail = true;
                                  isPhone = false;
                                });
                              },
                              child: Container(
                                child: Center(child: Text("Email")),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50)),
                                  color: isEmail
                                      ? AppColor.blue
                                      : AppColor.lightblue2,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print("phone");
                                setState(() {
                                  isEmail = false;
                                  isPhone = true;
                                });
                              },
                              child: Container(
                                child: Center(child: Text("Phone")),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50)),
                                  color: isPhone
                                      ? AppColor.blue
                                      : AppColor.lightblue2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      if (isEmail == true)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              prefixIcon: SizedBox(
                                  height: 8,
                                  width: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        "assets/icons/ic_email.png"),
                                  )), /////////////color///////////
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ), //////////color///////////
                              hintText: "Email Address",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      if (isPhone == true)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: IntlPhoneField(
                            validator: (val) {
                              if (val!.isValidNumber()) {
                                return "Enter correct Phone";
                              } else {
                                return null;
                              }
                            },
                            controller: phone,
                            disableLengthCheck: true,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
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
                      SizedBox(
                        width: 400,
                        height: 45,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (formkey.currentState!.validate()) {
                                print("valid");
                              } else {
                                print("invalid");
                              }
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(color: AppColor.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Remember Password?",
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: AppColor.voilet),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
