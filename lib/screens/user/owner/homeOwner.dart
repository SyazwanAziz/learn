import 'package:flutter/material.dart';

class HomeOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('Haircut'),
          subtitle: Text('30 minutes | RM15'),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('Wash & Cut'),
          subtitle: Text('60 minutes | RM30'),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('Rebonding'),
          subtitle: Text('90 minutes | RM60'),
        ),
      )
    ])));
  }
}
