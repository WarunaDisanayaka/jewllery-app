import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/constance.dart';
import 'package:jewllery_app/core/viewmodel/control_view_model.dart';
import 'package:jewllery_app/core/viewmodel/home_view_model.dart';
import 'package:jewllery_app/view/details_view.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget{
  final List<String> names = <String>['s','s','s','s','s'];
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context){
    final homeController = Get.find<HomeViewModel>();
    final controlController = Get.find<ControlViewModel>();

    return GetBuilder<HomeViewModel>(
      builder: (controller)=>controller.loading.value
          ?CircularProgressIndicator()
          :Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100,left: 20,right: 20 ),
            child: Column(
              children: [
                _searchTextFormField(),
                SizedBox(height: 40,),
                CustomText(
                  text: "Categories",
                ),
                SizedBox(height: 20,),
                _listViewCategory(),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomText(
                    text:"Best Selling",
                    fontSize:18,),
                  CustomText(
                    text: "See all",
                    fontSize: 18,
                  ),
                //   Logout button can place here

                ],
                ),
                SizedBox(height: 25,),
                _listViewProduct(),
              ],
            ),
          ),
        ),
        // body: Center(child: ElevatedButton(onPressed:(){_auth.signOut();Get.offAll(LoginView());} , child: Text("Logout"),),),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }

  Widget _listViewCategory(){
    return GetBuilder<HomeViewModel>(
      builder: (controller)=>Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(height: 20,),
                CustomText(text: controller.categoryModel[index].name,)
              ],
            );
          }, separatorBuilder: ( context, index)=> SizedBox(
          width: 20,
        ),
        ),
      ),
    );
  }

  Widget _listViewProduct(){
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(
        height: 200,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width *.3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height:140,
                              width: MediaQuery.of(context).size.width *.4,
                              child: Image.network(controller.productModel[index].image,
                              fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    CustomText(
                      text: controller.productModel[index].description,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      fontSize: 12,

                    ),
                    CustomText(
                      text:'Rs '+ controller.productModel[index].price,
                      alignment: Alignment.bottomLeft,
                      fontSize: 16,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            );
          }, separatorBuilder: ( context, index)=> SizedBox(
          width: 20,
        ),
        ),
      ),
    );
  }

 Widget bottomNavigationBar(){
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
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




// Container(
// child:ElevatedButton(onPressed:(){_auth.signOut();Get.offAll(LoginView());},
// child: Text("Logout"),),),