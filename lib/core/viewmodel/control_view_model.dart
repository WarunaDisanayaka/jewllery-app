import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/view/cart_view.dart';
import 'package:jewllery_app/view/home_view.dart';
import 'package:jewllery_app/view/profile_view.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;

  get navigatorValue=>_navigatorValue;

  Widget _currentScreen = HomeView();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0:{
        _currentScreen = HomeView();
        break;
      }
      case 1:{
        _currentScreen = CartView();
        break;
      }
      case 2:{
        _currentScreen = ProfileView();
        break;
      }
    }
    update();

  }
}