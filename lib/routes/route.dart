import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/consts.dart';
import 'package:store/routes/login.dart';
import 'package:store/routes/signup.dart';
import './home.dart';

class Rout extends StatelessWidget {
  final Future<FirebaseApp> fireBaseTest = Firebase.initializeApp();
  Rout({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fireBaseTest,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
                child: Text(
              "Firebase is not connected !",
              style: Consts.textStyleOne,
            )),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
      
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapShot) {
              if (streamSnapShot.hasError) {
                return Scaffold(
                    body: Center(
                  child: Text("${streamSnapShot.error}"),
                ));
              }
              if (streamSnapShot.connectionState == ConnectionState.active) {
                User? user = streamSnapShot.data;
                if (user == null) {
                  print("connected to firebase");
                  return const LoginPage();
                } else {
                  return Home();
                }
              }
              return Container();
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
