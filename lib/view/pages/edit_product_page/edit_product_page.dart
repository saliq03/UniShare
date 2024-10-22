import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  String _title="title",_price='12300';
  String _description=" jion voioie fiojfeo  kjojo[ ;looi ;ljooi loijoi lknon lkjoi ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Edit info"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 200,
            color: Colors.pink,
          ),
          SizedBox(height: 10,),
          TextFormField(
            initialValue: _title,
            decoration: InputDecoration(labelText: 'Title'),
            onSaved: (value) => _title = value ?? '',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),


          SizedBox(height: 16),

          // Price TextFormField
          TextFormField(
            initialValue: _price,
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onSaved: (value) => _price = value ?? '',
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

          SizedBox(height: 16),
          Text("Description",style: TextStyle(fontWeight: FontWeight.bold),),
          // Description TextFormField
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey.shade300,
            child: TextFormField(

              initialValue: _description,
              decoration: InputDecoration(
              border: OutlineInputBorder(

              ),),
              maxLines: 10 ,
              onSaved: (value) => _description = value ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
          ),

        ],
      ),
    );
  }
}
