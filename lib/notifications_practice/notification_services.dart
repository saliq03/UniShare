import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_settings/app_settings.dart';
class NotificationServices{
   FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;

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
         print("user granted permission");
      }
      else if(settings.authorizationStatus==AuthorizationStatus.provisional){
         print("user granted provisional permission");
      }
      else{
         AppSettings.openAppSettings();
         print("user denied permission");
      }
   }
   Future<String> getDeviceToken()async{
      String? token=await firebaseMessaging.getToken();
      return token!;
   }
}