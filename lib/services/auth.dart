import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn/model/user.dart';
import 'package:learn/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user base on firebaseUser
  UserUid _userFromFirebaseUser(User user) {
    return user != null ? UserUid(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserUid> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailandPassword(
      String email, String password, String userType) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          'Name', 'Phone Number', 'Adress', 'Location',
          userType: userType);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
