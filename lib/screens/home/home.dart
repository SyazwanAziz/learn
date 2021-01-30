import 'package:learn/screens/customer/accountUpdate.dart';
import 'package:learn/screens/customer/historyCust.dart';
import 'package:learn/screens/customer/homeCust.dart';
import 'package:learn/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/services/database.dart';
import 'package:provider/provider.dart';
import 'package:learn/model/update.dart';
import 'package:learn/screens/customer/accCust.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    AccountCust(),
    HomeCust(),
    HistoryCust(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.red[300],
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: AccUpd(),
            );
          });
    }

    return StreamProvider<List<UpdAcc>>.value(
        value: DatabaseService().user,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text('MyBooking'),
            leading: Container(),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          endDrawer: Drawer(
              child: ListView(children: <Widget>[
            ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit account info'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccUpd()));
                }),
            ListTile(
              leading: Icon(Icons.design_services),
              title: Text('Edit service'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Scan QR Code'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ])),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'History'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            fixedColor: Colors.red,
          ),
        ));
  }
}
