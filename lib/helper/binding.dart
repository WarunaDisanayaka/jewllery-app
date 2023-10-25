import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';
import 'package:jewllery_app/core/viewmodel/home_view_model.dart';

class Binding extends Bindings{
  void dependencies(){
      Get.lazyPut(() => AuthViewModel());
      Get.lazyPut(() => HomeViewModel());
  }
}