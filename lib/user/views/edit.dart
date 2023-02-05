
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_goes_brr/user/controller/user.dart';

import '../../add/controller/add.dart';

class EditScreen extends StatelessWidget {

  UserController userController = Get.put(UserController());
  AddController addController = Get.put(AddController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282424),
      appBar:AppBar(
        backgroundColor: const Color(0xff252836),
        elevation: 0,
        toolbarHeight: 80.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Text(
              "Add Money",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            GestureDetector(
                child: Text(
                  "Post",
                  style: TextStyle(color: const Color(0xffB548C6), fontSize: 16.sp),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Container(
                width: 400.sp,
                decoration: BoxDecoration(
                  color: Color(0xff3C3C434A),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.sp,
                    ),
                    CircleAvatar(
                      radius: 40.sp,
                      backgroundImage: const AssetImage('assets/Oval.png'),
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Change Profile Photo',
                      style: TextStyle(color: Colors.red),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(
                      feild: 'Name',
                      info: userController.user.value.name,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(
                      feild: 'Username',
                      info: userController.user.value.name,
                    ),

                    SizedBox(
                      height: 20.h,
                    ),


                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(
                      feild: 'Private Information',
                      isbold: true,
                      info: '',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(feild: 'Email', info: userController.user.value.email),

                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(feild: 'Phone', info: '+91 704 555 0147'),

                    SizedBox(
                      height: 20.h,
                    ),
                    EditRow(feild: 'Gender', info: 'Female'),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditRow extends StatelessWidget {
  EditRow(
      {Key? key,
        required this.feild,
        this.info = '',
        this.isbold = false,
        this.weight = FontWeight.bold})
      : super(key: key);

  final String feild;
  String info = '';
  bool isbold = false;
  FontWeight weight = FontWeight.bold;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Text(

            feild,
            style: TextStyle(fontWeight: weight,color: Colors.white),
          ),
        ),
        SizedBox(
          width: 110.w,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: info,
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        
      ],
    );
  }
}

