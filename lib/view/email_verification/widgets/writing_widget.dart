import 'package:flutter/cupertino.dart';

class WritingWidget extends StatelessWidget {
  const WritingWidget({super.key,required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,width: double.infinity,),
        Text("Please verify your email",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("you're almost there! We sent an email to",style: TextStyle(fontSize: 17),),
        Text(email,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        SizedBox(height: 30,),
        Text("just click on the link in that email to complete your signup.",style: TextStyle(fontSize: 16),),
        SizedBox(height: 30,),
        Text("Can't find the email",style: TextStyle(fontSize: 17),),
        SizedBox(height: 20,),
      ],
    );
  }
}
