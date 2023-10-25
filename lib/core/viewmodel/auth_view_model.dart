import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jewllery_app/core/service/FireStoreUser.dart';
import 'package:jewllery_app/model/user_model.dart';
import 'package:jewllery_app/view/home_view.dart';


class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> _user = Rx<User?>(null);

  String email='',password='',name='';

  String? get user=>_user.value?.email;

  void onInit(){
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void onReady(){
    super.onReady();
  }


  void onClose(){
    super.onClose();
  }

  void googleSignInMethod()async{
    final GoogleSignInAccount? googleUser =  await _googleSignIn.signIn();
    print(googleUser);
  }

  void signInWithEmailAndPassword()async{
        try{
            await _auth.signInWithEmailAndPassword(email: email, password: password);
            Get.offAll(HomeView());
        }catch(e){
            print(e.toString());
            Get.snackbar('Error login account', e.toString(),colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
        }
  }
  void createAccountWithEmailAndPassword()async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId:user.user!.uid,
          email: user.user?.email ?? '', // Use an empty string as a default value if email is null
          name:name,
          pic:'',
        ));
      });
      Get.offAll(HomeView());
    }catch(e){
      print(e.toString());
      Get.snackbar('Error login account', e.toString(),colorText: Colors.black,snackPosition: SnackPosition.BOTTOM);
    }
  }
}