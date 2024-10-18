import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:unishare/utils/utils.dart';
import 'package:unishare/viewmodels/controller/home_controllers/donate_controller.dart';

import '../../../res/components/rectangle_button.dart';

class FreeOrPaidScreen extends StatefulWidget {
  const FreeOrPaidScreen({super.key});

  @override
  State<FreeOrPaidScreen> createState() => _FreeOrPaidScreenState();
}

class _FreeOrPaidScreenState extends State<FreeOrPaidScreen> {

  final donateController=Get.put(DonateController());
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set your offer"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300,width: 1))
        ),
        child:  Obx((){
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    // Free radio button
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text("Free"),
                        value: 'Free',
                        groupValue: donateController.offerType.value,
                        onChanged: (value) {
                          donateController.changeOfferType(value!);
                        },
                      ),
                    ),

                    // Paid radio button
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text("Paid"),
                        value: 'Paid',
                        groupValue: donateController.offerType.value,
                        onChanged: (value) {
                          donateController.changeOfferType(value!);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Show price input field if "Paid" is selected
                if (donateController.offerType.value == 'Paid')
                  TextFormField(
                    controller: donateController.priceController.value,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.currency_rupee,color:Colors.purpleAccent ,),
                      labelText: "Set Price",
                      border: OutlineInputBorder(),
                      hintText: "Enter the price",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter price';
                      }
                    },
                  ),

                Spacer(),
                RectangleButton(title: "Next", onPress: (){
                    if(_formKey.currentState!.validate()){
                      donateController.AddProduct(donateController.priceController.value.toString());
                    }




                }, buttonColor: Colors.purpleAccent.shade100,),
                SizedBox(height: 30,)
              ],
            ),
          );
        })

      ),
    );
  }
}
