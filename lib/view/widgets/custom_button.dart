import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';

import '../../constance.dart';

class CustomButton extends StatelessWidget{

  final String text;
  final void Function() onPressed;

  CustomButton(this.text, this.onPressed);

  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          primary: primaryColor,
          fixedSize: Size.fromWidth(400),
          padding: EdgeInsets.all(18),
          alignment: Alignment.center
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        color: Colors.white,
      )
    );
  }
}