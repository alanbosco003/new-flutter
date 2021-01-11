import 'package:my_loving_diary/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_loving_diary/models/user.dart';
import 'package:my_loving_diary/screens/authinticate/authenticate.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // create user obj based on firebased uder //AuthService

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // GET UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  // sign in anoni.....
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email
  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// registar with email
  Future registerwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document

      await DatabaseService(uid: user.uid).updateUserData('0', 'name', 100);
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

  createUserWithEmailAndPassword({String email, String password}) {}

  currentUser() {}
}
