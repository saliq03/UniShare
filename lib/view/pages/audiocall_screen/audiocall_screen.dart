import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:unishare/model/message_model/call_model.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/services/chat_services/call_services.dart';
import 'package:unishare/viewmodels/controller/profile_controller.dart';
import 'package:unishare/viewmodels/services/generate_ids_service.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
class AudiocallScreen extends StatelessWidget {
   AudiocallScreen({super.key,required this.target,required this.call});
   final UserModel target;
   final CallModel call;
 final profileController=Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    String callId=GenerateIds().generateRoomId(target.email);
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: int.parse(dotenv.env['ZEGO_APP_ID']!),
            appSign: dotenv.env['ZEGO_APP_SIGN']!,
            userID: profileController.currentUser.value?.email?? 'root',
            userName: profileController.currentUser.value?.name?? 'root',
            callID: callId,
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
          onDispose: () {
            CallServices().endCall(call);
          },
          // onDispose: ,
        ));
  }
}
