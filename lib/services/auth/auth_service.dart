import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user
  User? getCurrentsUser() {
    return _auth.currentUser;
  }

  List users = [
    {'name': 'Виктор', 'surname': 'Власов'},
    {'name': 'Саша', 'surname': 'Алексеев'},
    {'name': 'Пётр', 'surname': 'Жаринов'},
    {'name': 'Алина', 'surname': 'Жукова'},
  ];

  int? indexName;

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (email == 'test@gmail.com') {
        indexName = 0;
      } else if (email == 'test2@gmail.com') {
        indexName = 1;
      } else if (email == 'user@gmail.com') {
        indexName = 2;
      } else {
        indexName = 3;
      }

      // save user info if it doesn't already exists
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': users[indexName!]['name'],
        'surname': users[indexName!]['surname']
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
