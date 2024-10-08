import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:unishare/res/routes/routes.dart';
import 'package:unishare/view/authentication/forget_password/after_forgetpassword_screen.dart';
import 'package:unishare/view/authentication/forget_password/forget_password.dart';
import 'package:unishare/view/home_bottom_nav/home_bottom_nav.dart';
import 'package:unishare/view/splash_Screen.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  Firebase.initializeApp(options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      appId: dotenv.env['APP_ID']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['PROJECT_ID']!)):
      Firebase.initializeApp();
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
      home: HomeBottomNav(),
      getPages: AppRoutes.appRoutes(),

    );
  }
}

