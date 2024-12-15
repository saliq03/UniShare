
import 'package:flutter/cupertino.dart';

class WritingWidget extends StatelessWidget {
  const WritingWidget({super.key,required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,width: double.infinity,),
        const Text("Please verify your email",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        const Text("you're almost there! We sent an email to",style: TextStyle(fontSize: 17),),
         Text(email,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        const Text("just click on the link in that email to complete your signup.",style: TextStyle(fontSize: 16),),
        const SizedBox(height: 30,),
        const Text("Can't find the email",style: TextStyle(fontSize: 17),),
        const SizedBox(height: 20,),
      ],
    );
  }
}
