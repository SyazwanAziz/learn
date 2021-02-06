import 'package:flutter/material.dart';

class HomeCust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final shops = Provider.of<List<UserData>>(context) ?? [];

    // return ListView.builder(
    //   itemCount: shops.length,
    //   itemBuilder: (context, index) {
    //     return ShopTile(shop: shops[index]);
    //   },
    // );

    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
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
              title: Text('Barber Shop'),
              subtitle: Text('Serdang'),
              onTap: () {},
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
              title: Text('Ahmad Clinic'),
              subtitle: Text('Cheras'),
              onTap: () {},
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
              title: Text('workshop Ali'),
              subtitle: Text('Seri Kembangan'),
              onTap: () {},
            ),
          ),
        ],
      )),
    );
  }
}
