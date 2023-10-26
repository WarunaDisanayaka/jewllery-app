import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';
import 'package:jewllery_app/view/login_view.dart';

import '../core/viewmodel/home_view_model.dart';

class ControlView extends GetWidget<AuthViewModel>{
  Widget build(BuildContext context){
    return Obx((){
      return(Get.find<AuthViewModel>().user ==null)
          ?LoginView()
          :GetBuilder<HomeViewModel>(
          builder: (controller)=>Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
          ),
      );
    });
  }
  Widget bottomNavigationBar(){
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller)=>BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Text("Cart"),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Text("Account"),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ))

        ],
        currentIndex: controller.navigatorValue,
        onTap: (index)=>controller.changeSelectedValue(index),
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }

}