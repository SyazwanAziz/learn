import 'package:flutter/material.dart';

class HistoryOwner extends StatelessWidget {
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
          leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/mybookings-aeae0.appspot.com/o/image3770?alt=media&token=452ba108-90db-4cec-b1c6-cc7b0423c153')),
          title: Text('Albab | Haircut'),
          subtitle: Text('013-8645231 | 10.00 am | 10th Feb 2021'),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/mybookings-aeae0.appspot.com/o/image3770?alt=media&token=452ba108-90db-4cec-b1c6-cc7b0423c153')),
          title: Text('Aiman | Wash & Cut'),
          subtitle: Text('012-6642348 | 12.00 pm | 17th Feb 2021'),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Card(
        elevation: 10.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/mybookings-aeae0.appspot.com/o/image3770?alt=media&token=452ba108-90db-4cec-b1c6-cc7b0423c153')),
          title: Text('Jay | Rebonding'),
          subtitle: Text('015-6631792 | 1.00 pm | 20th Feb 2021'),
        ),
      )
    ])));
  }
}
