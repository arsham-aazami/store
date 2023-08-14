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
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  void navigateToHomePage() => print("ars");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.customizedGrayOne,
      body: Container(
        child: Stack(
          children: [
            FutureBuilder(
              future: _products.doc(widget.productId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error as String),
                  );
                } 
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                
                }
                return Center(
                    child: Container(
                         child:Text("arsham")
                    ),
                  );
                
              },
            ),
            CustomActionBar(
                title: CustomButton(
                  text: "<>",
                  buttonContainerColor: Consts.customizedBlue,
                  width: 34,
                  height: 45,
                  borderColor: Consts.customizedGrayOne,
                  click: navigateToHomePage,
                ),
                number: 0)
          ],
        ),
      ),
    );
  }
}
