import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/core/service/home_services.dart';
import 'package:jewllery_app/core/viewmodel/control_view_model.dart';

import '../../model/category_model.dart';

class HomeViewModel extends GetxController{

  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];



  // final ControlViewModel _controlViewModel = ControlViewModel(); // Create an instance of HomeViewModel


  HomeViewModel(){
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        final categoryData = value[i].data() as Map<String, dynamic>;
        _categoryModel.add(CategoryModel.fromJson(categoryData));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}