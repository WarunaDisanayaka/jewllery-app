import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewllery_app/model/product_model.dart';
import 'package:jewllery_app/view/web_view.dart';
import 'package:jewllery_app/view/widgets/custom_button.dart';
import 'package:jewllery_app/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget{
  ProductModel model;
  DetailsView({required this.model});

  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,)),
          SizedBox(height: 15,),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(text: model.name,),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey,
                            )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                            CustomText(
                               text: 'Size',
                             ),
                             CustomText(
                               text: model.sized,
                             )
                           ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Color',
                              ),
                              CustomText(
                                text: model.color,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: 'Details',
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: model.description,
                    )
                  ],
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "Price",
                    ),
                    CustomText(
                      text: model.price,
                    )
                  ],
                ),
                Container(
                  height: 55,
                  width: 120,
                    child: CustomButton(
                      'Try AR',
                          () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: "https://webar.rocks/demos/face/demos/earrings2D"), // Replace with your desired URL
                          ),
                        );
                      },
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}