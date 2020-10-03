import 'package:flutter/cupertino.dart';

class MentorSignIn {
  String email, password;

  MentorSignIn({@required this.email, @required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
