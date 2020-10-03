import 'dart:convert';
import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:counselling_gurus/Animations/FadeAnimation.dart';
import 'package:counselling_gurus/Pages/Mentor/StartingPages/IntroSlider.dart';
import 'package:counselling_gurus/Pages/Mentor/TelephonicInterview.dart';
import 'package:counselling_gurus/models/MentorModelSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/io_client.dart';
import 'package:toast/toast.dart';
import '../../Resources/Colors.dart' as color;
import 'StartingPages/LogInMentor.dart';

List<String> _years = ['Fresher', 'Sophomore', 'Pre-final Year', 'Final Year'];
String Selectedyear;

class MentorInfoMentor extends StatefulWidget {
  var page1data;

  MentorInfoMentor(this.page1data);

  @override
  _MentorInfoMentor createState() => _MentorInfoMentor(page1data);
}

class _MentorInfoMentor extends State<MentorInfoMentor> {
  var page1data;
  String clgYear;

  _MentorInfoMentor(this.page1data);

  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller1 = new TextEditingController();
  JsonDecoder jsonDecoder = new JsonDecoder();

  @override
  void initState() {
    super.initState();
  }

  MentorSignUp user;
  bool isLoading;
  String name,
      email,
      password,
      contact,
      branch,
      college,
      yearOfStudy,
      collegeId,
      aadhar;

  signUpUser() async {
    print(user.toJson());
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    await http.post('https://counsellinggurus.in:3001/mentor/auth/register',
        body: user.toJson(),
        headers: {"Accept": "application/json"}).then((response) {
      print(response.body);
      if (response.statusCode == 500) {
        Toast.show("Internal Server Error. Please try again later.", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        Toast.show("Applied Successfully!", context,
            duration: Toast.LENGTH_LONG);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LogInMentor()),
          (route) => true,
        );
      }
    }).catchError((error) =>
        Toast.show("Server Error!", context, duration: Toast.LENGTH_LONG));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ColumnSuper(
          innerDistance: -50,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 520,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("College Name",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40,top: 20,right: 40),
                    child: TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                          hintText: "Enter College Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("Branch Name",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40,top: 20,right: 40),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Enter Branch Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text("College Year",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    onTap: (){
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    isExpanded: false,
                    hint: Text('Please choose your college year'),
                    value: Selectedyear,
                    onChanged: (val){
                      setState(() {
                        Selectedyear = val;
                        clgYear = Selectedyear;
                      });
                    },
                    items: _years.map((String val){
                      return DropdownMenuItem<String>(
                        child: Column(
                          children: <Widget>[
                            Text(val,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        value: val,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        name = page1data[2]
                            .toString(); //[em,aa,name,contact,collegeid]
                        email = page1data[0].toString();
                        contact = page1data[3].toString();
                        branch = _controller.text.toString();
                        college = _controller1.text.toString();
                        yearOfStudy = clgYear.toString();
                        collegeId = page1data[4].toString();
                        aadhar = page1data[1].toString();
                        user = new MentorSignUp(
                          name: name,
                          email: email,
                          contact: contact,
                          branch: branch,
                          college: college,
                          collegeId: collegeId,
                          aadhar: aadhar,
                          yearOfStudy: yearOfStudy,);
                      });
                      signUpUser();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("SUBMIT", style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class RadioGroup extends StatefulWidget{
  @override
  RadioGroupWidget createState() {
    return RadioGroupWidget();
  }

}

class RadioGroupWidget extends State{
  final index = [1,2,3,4,5];
  int val;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(title: Text('Fresher'), groupValue: val, onChanged: (index) => setState((){ val=1;}),value: index[0],),
        RadioListTile(title: Text('Sophomore'), groupValue: val, onChanged: (index) => setState(() => val=2),value: index[1],),
        RadioListTile(title: Text('Pre-Final Year'), groupValue: val, onChanged: (index) => setState(() => val=3),value: index[2],),
        RadioListTile(title: Text('Final Year'), groupValue: val, onChanged: (index) => setState(() => val=4),value: index[3],),
        RadioListTile(title: Text('Passout'), groupValue: val, onChanged: (index) => setState(() => val=5),value: index[4],),
      ],
    );
  }

}