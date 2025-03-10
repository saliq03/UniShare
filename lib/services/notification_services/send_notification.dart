import 'package:unishare/services/notification_services/notification_server_key.dart';
import 'package:http/http.dart' as http;
class SendNotifications{
  static void sendNotificationToSpecificUser({
    required String? token,
    required String? title,
    required String? body,
    required Map<String,dynamic>? data})async{
      String serverKey=await NotificationServerKey().getServerKey();
      String url="https://fcm.googleapis.com/v1/projects/unishare-b55c6/messages:send";
      var headers={
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',};
      Map<String,dynamic> message={
                                "message":{
                                     "token":token,
                                     "notification":{"body":body, "title":title},
                                     "data":data
                                          }
                                  };

       var response= await http.post(
         Uri.parse(url),
         headers: headers,
         body: message);
      if (response.statusCode == 200) {
        print("Notification Send Successfully!");
      } else {
        print("Notification not send!");
      }
  }
}