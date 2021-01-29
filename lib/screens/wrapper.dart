import 'package:flutter/material.dart';
import 'package:learn/model/user.dart';
import 'package:learn/screens/authenticate/authenticate.dart';
import 'package:learn/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid>(context);
    print(user);
    //return either Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
