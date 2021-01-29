import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learn/model/user.dart';
import 'package:learn/services/database.dart';
import 'package:learn/shared/loading.dart';
import 'package:learn/shared/constants.dart';
import 'package:geolocator/geolocator.dart';

class AccUpd extends StatefulWidget {
  @override
  _AccUpdState createState() => _AccUpdState();
}

class _AccUpdState extends State<AccUpd> {
  int selectedRadio;
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _phoneNum;
  String _address;
  String _location = 'Location';

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _location = "${position.latitude}, ${position.longitude}";
    });
  }

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
                            vertical: 20.0, horizontal: 10.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Name/Shop Name'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter a name' : null,
                                onChanged: (val) => setState(() => _name = val),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Phone Number'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter a name' : null,
                                onChanged: (val) =>
                                    setState(() => _phoneNum = val),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Address/Shop Address',
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Please enter a name' : null,
                                onChanged: (val) =>
                                    setState(() => _address = val),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  hintText: _location,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _getCurrentLocation();
                                    },
                                    icon: Icon(Icons.location_searching),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red)),
                                color: Colors.red[800],
                                child: Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await DatabaseService(uid: user.uid)
                                        .updateUserData(
                                      _name ?? userData.name,
                                      _phoneNum ?? userData.phoneNum,
                                      _address ?? userData.address,
                                      _location ?? userData.location,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            ],
                          ),
                        ))));
          } else {
            return Loading();
          }
        });
  }

  String buildString(String val) => val.toString();
}
