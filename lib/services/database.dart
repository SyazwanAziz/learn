import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn/model/update.dart';
import 'package:learn/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference accountCollection =
      FirebaseFirestore.instance.collection('customer');

  Future updateUserData(String name, String phoneNum, String address) async {
    return await accountCollection.doc(uid).set({
      'name': name,
      'phoneNum': phoneNum,
      'address': address,
    });
  }

  //brew list form snapshot
  List<UpdAcc> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UpdAcc(
        name: doc.data()['name'] ?? '',
        phoneNum: doc.data()['phoneNum'] ?? '',
        address: doc.data()['address'] ?? '',
      );
    }).toList();
  }

  // get brews stream
  Stream<List<UpdAcc>> get brews {
    return accountCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return accountCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      phoneNum: snapshot.data()['phoneNum'],
      address: snapshot.data()['address'],
    );
  }
}
