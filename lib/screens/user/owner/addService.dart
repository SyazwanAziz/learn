import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/model/user.dart';
import 'package:learn/services/database.dart';
import 'package:learn/shared/constants.dart';
import 'package:learn/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:learn/model/user.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String _service;

  String _desc;

  String _price;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid>(context);
    return AlertDialog(
      key: _formKey,
      title: Text("Add service"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  hintText: 'Service Name', fillColor: Colors.red[100]),
              validator: (val) => val.isEmpty ? 'Enter service name' : null,
              onChanged: (val) => setState(() => _service = val),
            ),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: 'Description', fillColor: Colors.red[100]),
                validator: (val) =>
                    val.isEmpty ? 'Enter description for the service' : null,
                onChanged: (val) => setState(() => _desc = val)),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                  hintText: 'Price', fillColor: Colors.red[100]),
              validator: (val) => val.isEmpty ? 'Enter price or FREE' : null,
              onChanged: (val) => setState(() => _price = val),
            ),
            SizedBox(height: 10.0),
            FlatButton(
                child: Text("Add service"),
                color: Colors.green,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    DatabaseService(uid: user.uid)
                        .addService(_service, _desc, _price);
                    Navigator.pop(context);
                  } else {
                    Loading();
                    Text('Please fill in the blank field!!!');
                  }
                }),
            FlatButton(
              child: Text("Cancel"),
              color: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
