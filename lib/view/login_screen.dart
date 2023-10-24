import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:jewelry_app/view/widgets/custom_text.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';

import '../constance.dart';

class LoginScreen extends StatelessWidget {
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
            Column(
              children: [
                CustomText(text: 'Email', fontSize: 14, color: Colors.grey.shade900,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'example@email.com',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),  // Add some spacing between the email and password fields
            Column(
              children: [
                CustomText(text: 'Password', fontSize: 14, color: Colors.grey.shade900,),
                TextFormField(
                  obscureText: true,  // This will hide the entered password
                  decoration: InputDecoration(
                    hintText: 'Your Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
