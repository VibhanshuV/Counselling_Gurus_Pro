import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AfterPlans extends StatelessWidget{
  int index;
  AfterPlans(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text('Plan '+ index.toString() ,style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

}