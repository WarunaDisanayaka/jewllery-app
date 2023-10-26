import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();

  int get navigatorValue=>_navigatorValue;
  Widget get currentScreen=>_currentScreen;

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