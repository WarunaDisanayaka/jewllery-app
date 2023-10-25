import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jewllery_app/model/user_model.dart';

class FireStoreUser{
  final CollectionReference _userColletionRef = FirebaseFirestore.instance.collection('Users');

  Future<void>addUserToFireStore(UserModel userModel)async {
    return await _userColletionRef.doc(userModel.userId).set(userModel.toJson(

    ));
  }
}