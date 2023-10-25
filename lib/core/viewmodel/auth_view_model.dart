import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jewllery_app/view/home_view.dart';


class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  String email='',password='',name='';

  void onInit(){
    super.onInit();
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

}