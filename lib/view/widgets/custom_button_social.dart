import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Center( // Center widget added here
      child: Align( // Align widget added here
        alignment: Alignment.centerRight, // Align to the right
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.grey.shade50,
          ),
          child: ElevatedButton(
            onPressed: () {
              onPress();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              elevation: 0,
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              onPrimary: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageName),
                SizedBox(
                  width: 40,
                ),
                CustomText(
                  text: text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
