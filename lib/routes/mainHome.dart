import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/consts.dart';
import 'package:store/routes/customActionBar.dart';

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
              } else if (snapshot.hasError) {
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
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return Center(
                            child: Container(
                              child: Text("Product Name : ${data["name"]}"),
                            ),
                          );
                      }).toList(),
                    )
                  ),
                );
            }),
        const CustomActionBar(
          number: 0,
          title: "Home",
        ),
        const Text("home Text")
      ]),
    );
  }
}
