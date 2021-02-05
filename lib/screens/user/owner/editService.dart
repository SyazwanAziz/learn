import 'package:flutter/material.dart';
import 'package:learn/screens/user/owner/addService.dart';
import 'package:learn/shared/constants.dart';

class EditService extends StatelessWidget {
  String _service;
  String _desc;
  String _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit service'),
          backgroundColor: Colors.red,
        ),
        body: Container(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddService()));
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Icon(
                Icons.add,
                size: 20,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            )));
  }
}
