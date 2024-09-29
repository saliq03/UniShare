import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unishare/res/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDrYiK56d8TzoJCdXHVi0l-30gZ-8Z1TmE",
      appId: "1:930045691163:android:a22ee280f9b7813dd57fbe",
      messagingSenderId: "930045691163",
      projectId: "unishare-b55c6")):
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

      getPages: AppRoutes.appRoutes(),

    );
  }
}

