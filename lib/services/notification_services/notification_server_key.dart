import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';

class NotificationServerKey{
  Future<String> getServerKey()async{
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final credentials=dotenv.env['CREDENTIALS']!;

    final client=await clientViaServiceAccount(ServiceAccountCredentials.fromJson(credentials),
        scopes);
    final serverKey=client.credentials.accessToken.data;
    return serverKey;
  }
}