import 'package:flutter/material.dart';
import 'package:unishare/res/components/rectangle_button.dart';
import 'package:unishare/view/pages/donate_page/free_or_paid_screen.dart';
import 'package:unishare/view/pages/donate_page/widgets/description_input_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/select_category_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/show_images_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/title_input_widget.dart';
import 'package:unishare/view/pages/donate_page/widgets/upload_image_widget.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add product deatails"),
        centerTitle: true,
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery.of(context).viewInsets.bottom > 0? Container():
                ShowImagesWidget(),
                const SizedBox(height: 20),
                 TitleInputWidget(),
                SizedBox(height: 16),
                DescriptionInputWidget(),
                const SizedBox(height: 16),
                SelectCategoryWidget(),
                Spacer(),
                RectangleButton(title: "Next", onPress: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FreeOrPaidScreen()));
                  }

                }, buttonColor: Colors.purpleAccent.shade100,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
