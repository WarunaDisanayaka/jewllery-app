import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/view/login_screen.dart';

class HomeView extends StatelessWidget{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: Center(child: ElevatedButton(onPressed:(){_auth.signOut();Get.offAll(LoginScreen());} , child: Text("Logout"),),),
    );
  }
}