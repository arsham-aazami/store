import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/consts.dart';
import 'package:store/widgets/CustomInput.dart';
import 'package:store/widgets/customButton.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  String emailValue = "";
  String passWordValue = "";

  void navigateToLoginPage() => Get.back();

  Future<void> showAlertDialog(String message) async {
    Get.defaultDialog(
        title: "Invalid input",
        titleStyle: Consts.textStyleOne,
        content: Text(message),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        buttonColor: Consts.colorStyleThree,
        textConfirm: 'Ok',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back());
  }

  // signing up process
  Future<String?> createAccountForUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailValue, password: passWordValue);
      return "ok";
    } on FirebaseAuthException catch (error) {
      if (error.code == "weak-password") {
        return "The password is too weak";
      }else if (error.code == "email-already-in-use") {
        return "The accoutn with this email is already in use!";
      }
      return error.message;
    } catch (error) {
      return error.toString();
    }
  }

  void signup() async {
    setState(() {
      isLoading = true;
    });
    String? result = await createAccountForUser();
    if (result != "ok") {
      showAlertDialog(result!);
    }
     setState(() {
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Are you new?\nCreate New Account",
                  style: Consts.headingTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    inputText: "Email ...",
                    onChanged: (value) {
                      emailValue = value;
                      print(value);
                    },
                    checkPassword: false,
                    onSubmit: (String) {},
                  ),
                  CustomInput(
                    inputText: "Password ...",
                    onChanged: (value) {
                      passWordValue = value;
                      print(value);
                    },
                    checkPassword: true,
                    onSubmit: (String) {},
                  ),
                  CustomButton(
                    loading: isLoading,
                    text: "Create Account",
                    buttonContainerColor: Consts.colorStyleThree,
                    buttonTextStyle: Consts.textStyleTwo,
                    width: 340,
                    click: () {
                      signup();
                    },
                    topPadding: 10,
                  )
                ],
              ),
              CustomButton(
                text: "Back to Login",
                buttonContainerColor: Consts.colorStyleFour,
                width: 340,
                click: navigateToLoginPage,
                bottomPadding: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
