import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_goes_brr/user/controller/user.dart';

class EditScreen extends StatelessWidget {
   EditScreen({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 16.sp, right: 5.sp),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.orange),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 400.sp,
              color: Colors.white,
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
                    height: 10.h,
                  ),
                  const Divider(color: Colors.black, thickness: 0.2),
                  SizedBox(
                    height: 40.h,
                  ),
                  EditRow(
                    feild: 'Name',
                    info: userController.user.value.name,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  EditRow(
                    feild: 'Username',
                    info: userController.user.value.name,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EditRow(
                    feild: 'Location',
                    info: 'Location',
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
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
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EditRow(feild: 'Phone', info: '+91 704 555 0147'),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  EditRow(feild: 'Gender', info: 'Female'),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.2,
                    indent: 180,
                  ),
                ],
              ),
            ),
          )
        ],
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Text(
            feild,
            style: isbold ? TextStyle(fontWeight: weight) : null,
          ),
        ),
        SizedBox(
          width: 110.w,
        ),
        Text(info),
      ],
    );
  }
}