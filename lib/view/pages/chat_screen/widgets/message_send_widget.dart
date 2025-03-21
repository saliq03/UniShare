import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unishare/view/pages/chat_screen/widgets/show_image_source.dart';
import 'package:unishare/viewmodels/controller/home_controllers/chat_screen_controller.dart';

class MessageSendWidget extends StatelessWidget {
  MessageSendWidget({required this.receiverId,super.key});
  final String receiverId;

  final csController=Get.put(ChatScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20,left: 20,right: 10),
      color: Colors.blue.shade300 ,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(16)
              ),

              child: Center(
                child: TextFormField(
                  controller: csController.messageController.value,
                  focusNode: csController.messageFocusNode.value,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(

                    suffixIcon: IconButton(
                        onPressed: (){ ShowImageSource().showImageSourceDialog(context);}, icon: Icon(Icons.camera_enhance,size: 35,)),
                    hintText: "Message...",
                    hintStyle: TextStyle(fontSize: 18),

                    border: InputBorder.none,           // Removes the border
                    enabledBorder: InputBorder.none,     // Removes the enabled border (default)
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (value){
                    csController.onMessageTextChanged(value);
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Obx((){
            return
            InkWell(
              onTap: (){
                csController.sendMessage(receiverId);
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(28)
                ),

                child: Center(child: csController.loading.value?
                    const CircularProgressIndicator():
                const Icon(Icons.send,color: Colors.white,)),
              ),
            );

          })

        ],
      ),
    );
  }
}
//
