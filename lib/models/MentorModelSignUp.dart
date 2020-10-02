import 'package:flutter/cupertino.dart';

class MentorSignUp {
  String name,
      email,
      password,
      contact,
      branch,
      college,
      yearOfStudy,
      collegeId,
      aadhar;

  MentorSignUp(
      {@required this.name,
      @required this.email,
      @required this.contact,
      @required this.branch,
      @required this.college,
      @required this.yearOfStudy,
      @required this.collegeId,
      @required this.aadhar});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": contact,
      "branch": branch,
      "college": college,
      "yearOfStudy": yearOfStudy,
      "collegeId": collegeId,
      "aadhar": aadhar,
    };
  }
}
