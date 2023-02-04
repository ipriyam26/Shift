import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/user/controller/user.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      backgroundColor: Color(0xff282424),
      appBar: AppBar(
          backgroundColor: Color(0xff252836),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: Colors.white,
                    fontSize: 16.sp),
              ),
              Text(
                "Edit Profile",
                style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: Colors.white,
                    fontSize: 16.sp),
              ),
              Text(
                "Done",
                style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: const Color(0xffB548C6),
                    fontSize: 16.sp),
              )
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 400.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.sp,
                  ),
                  CircleAvatar(
                    radius: 40.sp,
                    backgroundImage:
                        NetworkImage(userController.user.value.imageUrl),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change Profile Photo',
                        style: TextStyle(color: Color(0xffB548C6)),
                      )),
                  SizedBox(
                    height: 13.h,
                  ),
                  EditRow(
                    feild: 'Name',
                    info: userController.user.value.name,
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
                  EditRow(
                      feild: 'Email', info: userController.user.value.email),
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
