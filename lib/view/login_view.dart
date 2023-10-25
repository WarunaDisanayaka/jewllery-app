import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';
import 'package:jewllery_app/view/register_view.dart';
import 'package:jewllery_app/view/second_screen.dart';
import 'package:jewllery_app/view/widgets/custom_button.dart';
import 'package:jewllery_app/view/widgets/custom_button_social.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';
import 'package:jewllery_app/view/widgets/custom_text_form_field.dart';
import 'package:jewllery_app/constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email="", password="";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                  CustomText(text: 'Welcome', fontSize: 30,),
                  GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                      child: CustomText(text: 'Sign Up', color: primaryColor, fontSize: 18,)),
                ],
              ),
              SizedBox(height: 10),
              CustomText(text: 'Sign in to Continue', fontSize: 14, color: Colors.grey,),
              SizedBox(height: 30),
              CustomTextFormField('Email', 'example@email.com', (value){
               controller.email =value!;
              }, (value){
                if(value==null){
                  print("Error");
                }
              }),
              SizedBox(height: 20),
              CustomTextFormField('Password', '******************', (value) {controller.password = value!;}, (value){
                if(value==null){
                  print("Error");
                }
              }),
              SizedBox(height: 20),
              CustomText(text: 'Forgot Password', fontSize: 14, alignment: Alignment.topRight,),
              SizedBox(height: 20),
              CustomButton('SIGN IN', () {
                // Navigate to the SecondScreen when the button is pressed
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),
                //   ),
                // );
               _formKey.currentState?.save();
               controller.signInWithEmailAndPassword();
              }),
              SizedBox(height: 40),
              CustomText(text: '-OR-', alignment: Alignment.center,),
              SizedBox(height: 20),
              // CustomButtonSocial(
              //   text: 'Sign In with Facebook',
              //   onPress: () {
              //     // Handle Facebook sign-in here
              //   },
              //   imageName: 'assets/images/facebook.png',
              // ),
              SizedBox(height: 40),
              // CustomButtonSocial(
              //   text: 'Sign In Google',
              //   onPress: () {
              //     // Handle Google sign-in here
              //     controller.googleSignInMethod();
              //   },
              //   imageName: 'assets/images/google.png',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
