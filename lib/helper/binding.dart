import 'package:get/get.dart';
import 'package:jewllery_app/core/viewmodel/auth_view_model.dart';

class Binding extends Bindings{
  void dependencies(){
      Get.lazyPut(() => AuthViewModel());
  }
}