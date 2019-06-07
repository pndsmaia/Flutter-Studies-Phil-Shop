import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    _isLoading();
    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)
        .then((user) async {
      firebaseUser = user;
      await _saveUserData(userData);

      onSuccess();
      _noLoading();
    }).catchError((e) {
      onFail();
      _noLoading();
    });
  }

  signIn() {}

  signOut() async {
    await _auth.signOut();
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(userData);
  }

  void _noLoading() {
    isLoading = false;
    notifyListeners();
  }

  void _isLoading() {
    isLoading = true;
    notifyListeners();
  }
}
