import 'package:flutter/material.dart';

class HistoryCust extends StatelessWidget {
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
          title: Text('Dr Amir Clinic | CheckUp'),
          subtitle: Text('Serdang | 10.00 am | 10th Feb 2021'),
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
          title: Text('Mays Barber | Wash & Cut'),
          subtitle: Text('Kajang | 12.00 pm | 17th Feb 2021'),
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
          title: Text('Machine | Insurance Claim'),
          subtitle: Text('Kota Warisan | 1.00 pm | 20th Feb 2021'),
        ),
      )
    ])));
  }
}
