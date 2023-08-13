import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:store/dependencyInjection.dart';
import 'package:store/routes/login.dart';
import 'package:store/routes/route.dart';

Future<void> main()async {
  runApp(MyApp());
  // DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Rout(),
        theme: ThemeData(
            textTheme: GoogleFonts.b612TextTheme(Theme.of(context).textTheme)));
        
  }
}
