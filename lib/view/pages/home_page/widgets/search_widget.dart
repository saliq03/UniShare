import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,size: 30,),
          hintText: "Find Books, Buckets and More..",
          hintStyle: TextStyle(color: Colors.black54,fontSize: 18
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2))
      ),
    );
  }
}
