import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: GetBuilder<AuthViewModel>(
                  init: AuthViewModel(),
                  builder: (value) => Text("${value}"))),
         GetBuilder<AuthViewModel>(
             builder: (value)=> ElevatedButton(
           onPressed: () {

           },
           child: Text("Increment Counter"),
         )),

        ],
      ),
    );
  }
}
