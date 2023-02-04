import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 690.h,
            left: 90.w,
            child: CustomSlidingSegmentedControl<int>(
              innerPadding: EdgeInsets.all(12.sp),
            initialValue: 2,
            children: const {
              1: Text('Library',style: TextStyle(color: Colors.white),),
              2: Text('Image',style: TextStyle(color: Colors.white)),
              3: Text('Video',style: TextStyle(color: Colors.white)),
            },
            decoration: BoxDecoration(
              color: const Color(0xff252836),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            thumbDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xffB548C6),
              borderRadius: BorderRadius.circular(6.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              print(v);
            },
          ),)
        ],
      ),
    );
  }
}
