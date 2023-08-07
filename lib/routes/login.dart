import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/consts.dart';
import 'package:store/widgets/CustomInput.dart';
import 'package:store/widgets/customButton.dart';
import 'package:get/get.dart';
import './signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String emailValue = "";
  String passWordValue = "";

  void navigateToSignUpPage() => Get.to(() => SignUpPage());

  Future<String?> logingInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailValue, password: passWordValue);
      return "Ok";
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        return "NO user found for this email";
      } else if (error.code == "wrong-password") {
        return "The email and password don't match";
      }
    } catch (error) {
      return error.toString();
    }
    return null;
  }

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

  void login() async {
    setState(() {
      isLoading = true;
    });
    String? result = await logingInUser();
    if (result != "OK") {
      showAlertDialog(result!);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar("Successful", "You loged in successfully",
          backgroundColor: Consts.snackBarSuccessfulColor,
          icon: const Icon(Icons.check_circle));
      showAlertDialog(result!);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  "Welcome \nLogin to your account",
                  style: Consts.headingTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    inputText: 'Email...',
                    onChanged: (value) {
                      emailValue = value;
                      print(value);
                    },
                    checkPassword: false,
                    onSubmit: (String) {},
                  ),
                  CustomInput(
                    inputText: 'Password...',
                    onChanged: (value) {
                      passWordValue = value;
                      print(value);
                    },
                    checkPassword: true,
                    onSubmit: (String) {},
                  ),
                  CustomButton(
                    loading: isLoading,
                    text: "Login",
                    buttonTextStyle: Consts.textStyleTwo,
                    width: 340,
                    click: login,
                    topPadding: 10,
                  )
                ],
              ),
              CustomButton(
                text: "Create New Account",
                buttonContainerColor: Consts.colorStyleFour,
                width: 340,
                click: navigateToSignUpPage,
                bottomPadding: 15,
                leftPadding: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
