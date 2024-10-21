
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../res/colors/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 4,
        itemBuilder: (context,index){
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(width: 150,),
                ListTile(
                  leading: Container(
                    height: 100,width: 100,
                    color: AppColors.white,
                  ),
                  title: Container(
                    height: 10,width: 100,
                    color: AppColors.white,
                  ),
                  subtitle: Container(
                    height: 8,width: 200,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),);
        });
  }
}
