import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlePriceWidget extends StatelessWidget {
  const TitlePriceWidget({required this.title,required this.price,super.key});
  final String title,price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: title,
          decoration: InputDecoration(labelText: 'Title',
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)),
          // onSaved: (value) => _title = value ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
        ),
        SizedBox(height: 16),
        TextFormField(
          initialValue: price,

          decoration: InputDecoration(labelText: 'Price (for free set price as 0)',
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)
          ),
          keyboardType: TextInputType.number,
          // onSaved: (value) => _price = value ?? '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a price';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
      ],
    );
  }
}
