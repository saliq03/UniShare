import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../model/user_model/user_model.dart';
import '../../viewmodels/user_prefrences/user_prefrences.dart';
import '../firebase_services/firebase_services.dart';

class NotificationServices{
  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  void requestNotificationPermission()async{
    NotificationSettings settings= await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,);

    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      if (kDebugMode) {
        print("user granted permission");
      }
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      if (kDebugMode) {
        print("user granted provisional permission");
      }
    }
    else{
      AppSettings.openAppSettings();
      if (kDebugMode) {
        print("user denied permission");
      }
    }
  }

  void initLocalNotifications(BuildContext context, RemoteMessage message)async{
    var androidInitializationSettings=AndroidInitializationSettings('@mipmap/launcher_icon');
    var iosInitializationSettings=DarwinInitializationSettings();
    var initializationSettings=InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    await flutterLocalNotificationsPlugin.
    initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload){
          handleMessage(context,message);
        });
  }
  void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message){
      if(Platform.isIOS){
        forgroundMessage();
      }
      if(Platform.isAndroid){
        print(message.data);
        print(message.data["id"]);
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }

  Future<void> showNotifications(RemoteMessage message)async {
    AndroidNotificationChannel channel=AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        "High Importance Notifications",
        importance: Importance.max,
      showBadge: true,
      playSound: true,);

    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker',
       sound: channel.sound);

    DarwinNotificationDetails iosNotificationDetails=DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true );

    NotificationDetails notificationDetails=NotificationDetails(
        android: androidNotificationDetails,
        iOS:iosNotificationDetails);

    Future.delayed(Duration.zero,(){
      flutterLocalNotificationsPlugin.show(
          1,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }
// Handle on tap
  Future<void> setUpInteractMessage(BuildContext context)async{
    // when app is terminated
    RemoteMessage? initialMessage=await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!=null){
      handleMessage(context, initialMessage);
    }

    // when app is in bg
    FirebaseMessaging.onMessageOpenedApp.listen((event){
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context,RemoteMessage message){
    if(message.data["type"]=='msg'){
      // Navigator.push(context,
          // MaterialPageRoute(builder: (_)=>MessageScreen()));
    }
  }
  Future<String> getDeviceToken()async{
    String? token=await firebaseMessaging.getToken();
    return token!;
  }

  void  onRefreshToken() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      // Update the new token in Firestore
      updateDeviceToken(newToken);


    });
  }

  Future<void> updateDeviceToken(String token) async {
    UserModel user=await UserPrefrences().getUser();
    Map<String,dynamic> data={"FCM Token":token};

    FirebaseServices().updateData("Users", user.email, data);
  }
  Future<void> fetchFCMToken(String email)async{
    final snapshot=await FirebaseFirestore.instance.collection("Users")
        .where("Email",isEqualTo: email).get();
   print(snapshot.docs);
  }



  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}