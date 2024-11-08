import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unishare/model/user_model/user_model.dart';
import 'package:unishare/view/pages/users_profile/widgets/full_photo_widget.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({required this.user,super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: double.infinity),
        GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (BuildContext context)=>FullPhotoWidget(photo: user.Photo));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                border: Border.all(
                    color: Colors.green,
                    width: 2
                )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Hero(
                tag: user.Photo,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                  imageUrl: user.Photo,
                  placeholder: (context,url)=>const Center(child: CircularProgressIndicator(strokeWidth: 2,)),),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Text(user.Name,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
        Text(user.Email,style: const TextStyle(color: Color(0xFF979797),fontSize: 15,height: 1),),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          child: Text(user.Bio,style: const TextStyle(fontSize: 18,color: Color(0xFF979797),height: 1.3,),textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
