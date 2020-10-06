//import 'dart:convert';
//import 'package:counselling_gurus/Pages/Student/IntroSlider.dart';
import 'dart:convert';
import 'dart:io';

import 'package:counselling_gurus/models/MentorModelSignUp.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

//import 'package:shared_preferences/shared_preferences.dart';
import '../../../Animations/FadeAnimation.dart';

//import 'package:http/http.dart' as http;
//import '../../models/UserModelSignUp.dart';
import 'package:counselling_gurus/Pages/Mentor/MentorInfoMentor.dart';
import '../../../Resources/Colors.dart' as color;

class SignUpMentor extends StatefulWidget {
  @override
  _SignUpMentorState createState() => _SignUpMentorState();
}

class _SignUpMentorState extends State<SignUpMentor> with SingleTickerProviderStateMixin {

  TextEditingController nameController = new TextEditingController();
  TextEditingController contactController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController aadharController = new TextEditingController();
  TextEditingController collegeIdController = new TextEditingController();

  // bool passwordVisible, isLoading;
  // String name, email, password, contact;
  // MentorSignUp user;

  /* JsonDecoder jsonDecoder = new JsonDecoder();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

signUpUser() async{
    print(user.toJson());
    final ioc = new HttpClient();
    ioc.badCertificateCallback = (X509Certificate cert,String host,int port)=>true;
    final http = new IOClient(ioc);
    await http.post('https://counsellinggurus.in:3001/mentor/auth/register', body: user.toJson(), headers: {"Accept": "application/json"}).then((response) {
      print(response.body);
      if(response.statusCode==500)
      {
        Toast.show("Internal Server Error. Please try again later.",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
      }
      else
      {
        Toast.show("User Registered!", context,duration: Toast.LENGTH_LONG);
        List<String> page1data = [emailController.text.toString(),passwordController.text.toString()
          ,nameController.text.toString(),contactController.text.toString()];
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MentorInfoMentor(page1data)), (route) => true,);

        addToSF();
      }

    }).catchError((error)=>Toast.show("Server Error!", context,duration: Toast.LENGTH_LONG));
  }


  addToSF() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", emailController.text.toString());
    pref.setString("password", passwordController.text.toString());
    pref.setString("name", nameController.text.toString());
    pref.setString("contact", contactController.text.toString());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
    passwordController.dispose();
  } */
  addToSF() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("emailMent", emailController.text.toString());
    pref.setString("aadharMent", aadharController.text.toString());
    pref.setString("nameMent", nameController.text.toString());
    pref.setString("contactMent", contactController.text.toString());
    pref.setString("collegeIDMent", collegeIdController.text.toString());
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

  String aadharValidator(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 12 || value.length > 12) {
      return 'Enter a valid Aadhar Number';
    } else {
      return null;
    }
  }

  String idValidator(String value) {
    if (value.isEmpty) {
      return "College ID can't be empty";
    }
    if (value.length < 3) {
      return 'Enter a valid ID';
    } else {
      return null;
    }
  }

  String contactValidator(String value) {
    if (value.isEmpty) {
      return "Contact can't be empty";
    }
    if (value.length < 10) {
      return 'Enter a valid contact number';
    } else {
      return null;
    }
  }

  String nameValidator(String value) {
    if (value.isEmpty) {
      return "Username can't be empty";
    }
    if (value.length < 3) {
      return 'Enter a valid username';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
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
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Row(
                          children: [
                            SizedBox(width: 5),
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    FadeAnimation(
                        1,
                        Text(
                          "Apply For Mentoring",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                          SizedBox(height: 20,),
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
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    validator: nameValidator,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            Icons.person_outline),
                                        hintText: "Full Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    validator: contactValidator,
                                    controller: contactController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.contacts),
                                        hintText: "Contact Number",
                                        hintStyle: TextStyle(
                                            color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    validator: emailValidator,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    controller: aadharController,
                                    validator: aadharValidator,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          MdiIcons.cardBulleted),
                                      hintText: "Aadhar Number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[200]))
                                  ),
                                  child: TextFormField(
                                    controller: collegeIdController,
                                    validator: idValidator,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                          MdiIcons.schoolOutline),
                                      hintText: "College ID",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )),

                          SizedBox(height: 20,),
                          FadeAnimation(1.4,
                              InkWell(
                                child: Container(
                                  height: 45,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: color.buttonsMain
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      var page1data = [
                                        emailController.text.toString(),
                                        aadharController.text.toString(),
                                        nameController.text.toString(),
                                        contactController.text.toString(),
                                        collegeIdController.text.toString()
                                      ];
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              MentorInfoMentor(page1data)));
                                      /*setState(() {
                                        isLoading = true;
                                      });
                                      isLoading ? Center(
                                          child: CircularProgressIndicator()
                                      ): Container();
                                      setState(() {
                                        name = nameController.text.toString();
                                        email = emailController.text.toString();
                                        password = passwordController.text.toString();
                                        contact = contactController.text.toString();
                                        user = new UserSignUp( name: name, email: email, password: password,
                                            contact: contact
                                        );
                                      });
                                      addToSF();
                                      signUpUser();*/
                                    },
                                    child: Center(
                                      child: Text("Next", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(height: 8,),
                          Center(child: FadeAnimation(1.5, Text("or",
                            style: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),))),
                          SizedBox(height: 10,),
                          FadeAnimation(1.5, Text("Sign Up Using",
                            style: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold),)),
                          SizedBox(height: 8,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeAnimation(
                                    1.8,
                                    Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              50),
                                          color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          "Facebook",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text("/", style: TextStyle(color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                              SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                child: FadeAnimation(
                                    1.9,
                                    Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              50),
                                          color: Colors.black),
                                      child: Center(
                                        child: Text(
                                          "Github",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
