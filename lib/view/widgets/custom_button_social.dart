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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: ElevatedButton(
        onPressed: () {
          onPress(); // Call the onPress function here
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.zero, // Remove the default padding
          alignment: Alignment.center, // Center the content
          elevation: 0, // Remove the default elevation
          primary: Colors.transparent, // Set the background color to transparent
          onSurface: Colors.transparent, // Set the surface color to transparent
          onPrimary: Colors.transparent, // Set the primary color to transparent
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 100,
            ),
            CustomText(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
