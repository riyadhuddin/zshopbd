import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zshopbd/models/user.dart';
class UserServices{
  String collection = "users";
  Firestore _fireStore = Firestore.instance;

  void createUser(Map<String, dynamic> values){
    String id = values["id"];
    _fireStore.collection(collection).document(id).setData(values);
  }

  void updateUserData(Map<String, dynamic> values){
    _fireStore.collection(collection).document(values['id']).updateData(values);
  }
  Future<UserModel> getUserById(String id) => _fireStore.collection(collection).document(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });
}