import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';
import 'package:jewllery_app/view/home_view.dart';
import 'package:jewllery_app/view/login_view.dart';

class ControlView extends GetWidget<AuthViewModel>{
  Widget build(BuildContext context){
    return Obx((){
      return(Get.find<AuthViewModel>().user !=null)?HomeView():LoginView();
    });
  }
}