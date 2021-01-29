import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn/model/user.dart';
import 'package:learn/services/database.dart';
import 'package:learn/shared/loading.dart';
import 'package:learn/shared/constants.dart';

class AccUpd extends StatefulWidget {
  @override
  _AccUpdState createState() => _AccUpdState();
}

class _AccUpdState extends State<AccUpd> {
  int selectedRadio;
  final _formKey = GlobalKey<FormState>();

  String _service1, _service2, _service3;
  String _desc1, _desc2, _desc3;
  String _price1, _price2, _price3;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Scaffold(
                    backgroundColor: Colors.red[300],
                    body: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                trailing: new Container(
                                  child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        new Expanded(
                                            flex: 3,
                                            child: new TextField(
                                              decoration:
                                                  textInputDecoration.copyWith(
                                                      hintText:
                                                          'Name/Shop Name'),
                                              validator: (val) => val.isEmpty
                                                  ? 'Please enter a name'
                                                  : null,
                                              onChanged: (val) => setState(
                                                  () => _service1 = val),
                                            ))
                                      ]),
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red)),
                                color: Colors.red[800],
                                child: Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: null,
                              )
                            ],
                          ),
                        ))));
          } else {
            return Loading();
          }
        });
  }
}
