import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zshopbd/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zshopbd/models/user.dart';
enum Status{Uninitialized, Unauthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //getters
  Status get status => _status;
  FirebaseUser get user => _user;
  //make them public
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }
  Future<bool> signIn(String email, String password) async {
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email,password: password);
      return true;
    }catch(e){
     return _onError(e.toString());
    }
  }

  Future<bool> signUp() async {
    try{
       _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text,password: password.text).then((user){
        Map<String, dynamic> values = {
          "name": name.text,
          "email":  email.text,
          "id": user.user.uid,
        };
        _userServices.createUser(values);
      });
      return true;
    }catch(e){
    return _onError(e.toString());
    } 
  }

  bool _onError(String error){
     _status = Status.Unauthenticated;
      notifyListeners();
      print("this is error: $error ");
      return false;
  }
  
  Future signOut()async{
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if(firebaseUser == null){
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }
  
}