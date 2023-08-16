import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/consts.dart';
import 'package:store/routes/customActionBar.dart';
import 'package:store/routes/productDetails.dart';

class MainHome extends StatelessWidget {
  //Getting data from firestore
  final Stream<QuerySnapshot> _products =
      FirebaseFirestore.instance.collection("products").snapshots();
  MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Consts.customizedGrayOne),
      height: double.infinity,
      child: Stack(children: [
        StreamBuilder(
            stream: _products,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
                //if something went wrong
              } 
              if (snapshot.hasError) {
                Get.defaultDialog(
                    title: "Firebase Error",
                    titleStyle: Consts.textStyleOne,
                    content: Text(snapshot.error as String),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 22),
                    buttonColor: Consts.colorStyleThree,
                    textConfirm: 'Ok',
                    confirmTextColor: Colors.white,
                    onConfirm: () => Get.back());
              }
              // if application was loading the data form server
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                child: Container(
                    child: ListView(
                  //a list of data
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic>? data =
                        document.data() as Map<String, dynamic>;
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProductDetails(productId: document.id));
                          },
                          child: Container(
                            // height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(data["images"][1], fit: BoxFit.cover,)
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Consts.customizedBlue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                data['name'],
                                                style: Consts.textStyleTwo,
                                              ),
                                            )),
                                        Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Consts.snackBarSuccessfulColor,
                                                  borderRadius: BorderRadius.circular(12)
                                            ),
                                            
                                            child:  Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                 "\$${data["price"]}" ,
                                                style: Consts.textStyleTwo,
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  }).toList(),
                )),
              );
            }),
        const CustomActionBar(
          number: 0,
          title:Text("Home", style: Consts.headingTextStyleTwo,),
        ),
      ]),
    );
  }
}
