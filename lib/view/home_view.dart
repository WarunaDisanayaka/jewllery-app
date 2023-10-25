import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/constance.dart';
import 'package:jewllery_app/core/viewmodel/home_view_model.dart';
import 'package:jewllery_app/view/cart_view.dart';
import 'package:jewllery_app/view/login_view.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>['s', 's', 's', 's', 's'];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70), // Add padding to push the search bar down
            child: _searchTextFormField(),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 40),
                CustomText(
                  text: "Categories",
                ),
                SizedBox(height: 20),
                _listViewCategory(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Best Selling",
                      fontSize: 18,
                    ),
                    CustomText(
                      text: "See all",
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                _listViewProduct(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Best Selling",
                      fontSize: 18,
                    ),
                    CustomText(
                      text: "See all",
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                _listViewProduct(),
              ],
            ),
          ),
        ],
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
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
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
                  child: Image.asset('assets/images/Icon_Mens Shoe.png'),
                ),
              ),
              SizedBox(height: 20),
              CustomText(text: names[index]),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return Container(
      height: 200,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * .3,
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
                        height: 140,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.asset(
                          'assets/images/Image.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomText(
                  text: "Mens watch",
                  alignment: Alignment.bottomLeft,
                  fontSize: 16,
                ),
                SizedBox(
                  height: 3,
                ),
                CustomText(
                  text: "Mens watch",
                  color: Colors.grey,
                  alignment: Alignment.bottomLeft,
                  fontSize: 12,
                ),
                CustomText(
                  text: "\$75",
                  alignment: Alignment.bottomLeft,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}




// Container(
// child:ElevatedButton(onPressed:(){_auth.signOut();Get.offAll(LoginView());},
// child: Text("Logout"),),),