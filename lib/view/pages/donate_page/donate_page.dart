import 'package:flutter/material.dart';
import 'package:unishare/res/components/rectangle_button.dart';
import 'package:unishare/view/pages/donate_page/free_or_paid_screen.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {

  final List<String> _categories = ["Books", "Utensils","other"];
  String? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              // SizedBox(height: 8),
              TextFormField(),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              TextFormField(),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(

                decoration: InputDecoration(
                  labelText: "Select Category",
                  labelStyle: TextStyle(color: Colors.black,fontSize: 17,fontStyle: FontStyle.italic),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.black)
                  ),


                ),

                value: _selectedCategory,
                items: _categories.map((gender) {

                  return DropdownMenuItem<String>(

                    value: gender,

                    child: Text(gender,style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
                onChanged: (value) {
                  _selectedCategory=value;
                },
                hint: Text('Select category',style: TextStyle(color: Colors.black,fontSize: 16),),
                dropdownColor: Colors.grey.shade500,
                iconEnabledColor: Colors.black54,



              ),
              Spacer(),
              RectangleButton(title: "Next", onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FreeOrPaidScreen()));
              }, buttonColor: Colors.purpleAccent.shade100,)
            ],
          ),
        ),
      ),
    );
  }
}
