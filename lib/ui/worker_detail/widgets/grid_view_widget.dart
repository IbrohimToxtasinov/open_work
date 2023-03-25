import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          mainAxisSpacing: 6,
          crossAxisCount: 2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25).r,
            child: Image.network('https://w7.pngwing.com/pngs/607/722/png-transparent-janitor-mop-cleaning-others-miscellaneous-white-building.png',
                width: 176, height: 140, fit: BoxFit.fill),
          );
        },
      ),
    );
  }
}
