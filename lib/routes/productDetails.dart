import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/routes/customActionBar.dart';
import 'package:store/routes/mainHome.dart';
import 'package:store/widgets/customButton.dart';

import '../consts.dart';

class ProductDetails extends StatefulWidget {
  final String productId;

  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final Stream<QuerySnapshot> _products =
      FirebaseFirestore.instance.collection("products").snapshots();

  void navigateToHomePage() => Get.to(MainHome());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(child: Text("arsham"),)
            CustomActionBar(
                title: CustomButton(
                    text: "back",
                    buttonContainerColor: Consts.customizedBlue,
                    width: 30,
                    height: 20,
                    click: navigateToHomePage),
                number: 0)
          ],
        ),
      ),
    );
  }
}
