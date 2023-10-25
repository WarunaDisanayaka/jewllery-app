import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewllery_app/view/widgets/custom_button.dart';
import 'package:jewllery_app/view/widgets/custom_button_social.dart';
// import 'package:jewelry_app/view/widgets/custom_text.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';
import 'package:jewllery_app/view/widgets/custom_text_form_field.dart';

import '../constance.dart';

class LoginScreen extends StatelessWidget {
  get controller => null;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Welcome', fontSize: 30,),
                CustomText(text: 'Sign Up', color: primaryColor, fontSize: 18,),
              ],
            ),
            SizedBox(height: 10),
            CustomText(text: 'Sign in to Continue', fontSize: 14, color: Colors.grey,),
            SizedBox(height: 30),
            CustomTextFormField('Email', 'example@email.com', (value){}, (value){}),
            SizedBox(height: 20),  // Add some spacing between the email and password fields
            CustomTextFormField('Password', '******************', (p0) { }, (p0) => null),
            SizedBox(height: 20,),
            CustomText(text: 'Forgot Password', fontSize: 14,alignment: Alignment.topRight,),
            SizedBox(height: 20,),
            CustomButton('SIGN IN', () { }),
            SizedBox(
              height: 40,
            ),
            CustomText(text: '-OR-',
              alignment: Alignment.center,),
            SizedBox(height: 20,),
            CustomButtonSocial(
              text: 'Sign In with Facebook',
              onPress: () {
                controller.facebookSignInMethod();
              },
              imageName: 'assets/images/facebook.png',
            ),
            SizedBox(
              height: 40,
            ),
            CustomButtonSocial(
              text: 'Sign In Google',
              onPress: () {
                controller.facebookSignInMethod();
              },
              imageName: 'assets/images/google.png',
            )
          ],
        ),
      ),
    );
  }
}
