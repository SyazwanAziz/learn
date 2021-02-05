import 'package:flutter/material.dart';

import 'package:learn/model/user.dart';

import 'package:learn/services/database.dart';

import 'package:provider/provider.dart';

class AccountDetail extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Form(
              key: _formKey,
              child: Scaffold(
                  body: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20.0,
                            ),
                            CircleAvatar(
                              radius: 75.0,
                              backgroundImage: NetworkImage(userData.photoURL),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              userData.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        width: 400.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Text(userData.phoneNum,
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center)),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: 400.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Text(userData.address,
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center)),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: 400.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Text(userData.location,
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center)),
                  ]))));
        });
  }
}
