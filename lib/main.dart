import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:unishare/res/routes/routes.dart';
import 'package:unishare/view/authentication/forget_password/after_forgetpassword_screen.dart';
import 'package:unishare/view/authentication/forget_password/forget_password.dart';
import 'package:unishare/view/home_bottom_nav/home_bottom_nav.dart';
import 'package:unishare/view/pages/favourites_page/favourites_page.dart';
import 'package:unishare/view/pages/product_page/product_page.dart';
import 'package:unishare/view/splash_Screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Platform.isAndroid?
   await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      appId: dotenv.env['APP_ID']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['PROJECT_ID']!)):
     await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UniShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
      builder: EasyLoading.init(),
    );
  }
}

