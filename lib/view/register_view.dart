import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';
import 'package:jewllery_app/view/login_view.dart';
import 'package:jewllery_app/view/widgets/custom_button.dart';
import 'package:jewllery_app/view/widgets/custom_button_social.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';
import 'package:jewllery_app/view/widgets/custom_text_form_field.dart';

import '../constance.dart';

class RegisterView extends GetWidget<AuthViewModel>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email="", password="";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.off(LoginView());
          },
          child: Icon(Icons.arrow_back,color: Colors.black,),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Sign Up', fontSize: 30,),
                ],
              ),
              SizedBox(height: 10),

              SizedBox(height: 30),
              CustomTextFormField('Name', 'Pera', (value){
                controller.email =value!;
              }, (value){
                if(value==null){
                  print("Error");
                }
              }),
              SizedBox(height: 20),
              CustomTextFormField('Email', 'example@email.com', (value){
                controller.email =value!;
              }, (value){
                if(value==null){
                  print("Error");
                }
              }),
              SizedBox(height: 20),
              CustomTextFormField('Password', '**************', (value) {controller.password = value!;}, (value){
                if(value==null){
                  print("Error");
                }
              }),
              SizedBox(height: 20),
              SizedBox(height: 20),
              CustomButton('SIGN UP', () {
                // Navigate to the SecondScreen when the button is pressed
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),
                //   ),
                // );
                _formKey.currentState?.save();
                controller.createAccountWithEmailAndPassword();
              }),
            ],
          ),
        ),
      ),
    );
  }
}