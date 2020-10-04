//import 'dart:convert';

//import 'package:counselling_gurus/models/UserModelSignIn.dart';
import 'dart:convert';
import 'dart:io';

import 'package:counselling_gurus/Pages/Mentor/StartingPages/IntroSlider.dart';
import 'package:counselling_gurus/Pages/Mentor/StartingPages/OTPVerificationPageMentor.dart';
import 'package:counselling_gurus/models/MentorModelSignIn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../../../Animations/FadeAnimation.dart';

// import 'MentorInfoMentor.dart';
//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Mentor/StartingPages/SignUpMentor.dart';
import '../../../Resources/Colors.dart' as color;
import 'SignUpMentor.dart';

class LogInMentor extends StatefulWidget {
  @override
  _LoginMentorState createState() => _LoginMentorState();
}

class _LoginMentorState extends State<LogInMentor> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passwordVisible, validateEmail = false, validatePassword = false;
  String email, password;

  MentorSignIn user;
  JsonDecoder jsonDecoder = new JsonDecoder();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  loginUser() async {
    print(user.toJson());
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    await http.post('https://counsellinggurus.in:3001/mentor/auth/login',
        body: user.toJson(),
        headers: {"Accept": "application/json"}).then((response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      } else {
        Toast.show("Login Successful!", context, duration: Toast.LENGTH_LONG);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => IntroSliderMentor()),
          (route) => false,
        );
        addToSF();
      }
      print(jsonDecoder.convert(res));
      return jsonDecoder.convert(res);
    }).catchError((error) => Toast.show("User Not Registered!", context,
        duration: Toast.LENGTH_LONG));
  }

  addToSF() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", emailController.text.toString());
    pref.setString("password", passwordController.text.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              color.bgGrad,
              color.bgGrad1,
              color.bgGrad2,
              color.bgGrad3
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        FadeAnimation(1.2, Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )
                                ]
                            ),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      validator: emailValidator,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          errorText: validateEmail
                                              ? "Email can't be empty"
                                              : null,
                                          hintText: "Email",
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      validator: pwdValidator,
                                      controller: passwordController,
                                      obscureText: !passwordVisible,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                          Icon(Icons.lock_outline),
                                          errorText: validatePassword
                                              ? "Password can't be empty"
                                              : null,
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme
                                                  .of(context)
                                                  .primaryColorDark,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                passwordVisible =
                                                !passwordVisible;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              key: _formkey,
                            )
                        )),
                        SizedBox(height: 40,),
                        InkWell(
                          child: FadeAnimation(1.3, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPageMentor()),),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(1.4,
                                  InkWell(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: color.buttonsMain
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             IntroSliderMentor()));
                                          FormState formState =
                                              _formkey.currentState;
                                          if (_formkey.currentState
                                              .validate()) {
                                            var email = emailController.text;
                                            var password =
                                                passwordController.text;

                                            setState(() {
                                              emailController.text.isEmpty
                                                  ? validateEmail = true
                                                  : validateEmail = false;
                                              passwordController.text.isEmpty
                                                  ? validatePassword = true
                                                  : validatePassword = false;
                                              email = emailController.text
                                                  .toString();
                                              password = passwordController.text
                                                  .toString();
                                              user = new MentorSignIn(
                                                  email: email,
                                                  password: password);
                                            });
                                            loginUser();
                                          }
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => IntroSliderMentor()));//remove this when backend fixed
                                        },

                                        child: Center(
                                          child: Text("Log In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: FadeAnimation(1.6,
                                  InkWell(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: color.buttonsMain
                                      ),
                                      child: InkWell(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpMentor()),),
                                        // Navigator.of(context).pushReplacementNamed('/SignUpPage'),
                                        child: Center(
                                          child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}