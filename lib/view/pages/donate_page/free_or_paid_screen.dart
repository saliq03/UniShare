import 'package:flutter/material.dart';

import '../../../res/components/rectangle_button.dart';

class FreeOrPaidScreen extends StatefulWidget {
  const FreeOrPaidScreen({super.key});

  @override
  State<FreeOrPaidScreen> createState() => _FreeOrPaidScreenState();
}

class _FreeOrPaidScreenState extends State<FreeOrPaidScreen> {
  String _offerType = 'free';
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
        child: Column(
          children: [
            // Divider(color: Colors.grey, // Set color of the divider
            //   thickness: 1, ),
            Row(
              children: [
                // Free radio button
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Free"),
                    value: 'free',
                    groupValue: _offerType,
                    onChanged: (value) {
                      setState(() {
                        _offerType = value!;
                      });
                    },
                  ),
                ),

                // Paid radio button
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Paid"),
                    value: 'paid',
                    groupValue: _offerType,
                    onChanged: (value) {
                      setState(() {
                        _offerType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Show price input field if "Paid" is selected
            if (_offerType == 'paid')
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee,color:Colors.purpleAccent ,),
                  labelText: "Set Price",
                  border: OutlineInputBorder(),
                  hintText: "Enter the price",
                ),
              ),

            Spacer(),
            RectangleButton(title: "Next", onPress: (){

            }, buttonColor: Colors.purpleAccent.shade100,),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
