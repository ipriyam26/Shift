import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:money_goes_brr/add/views/open.dart';

import 'package:money_goes_brr/add/views/post.dart';
import 'package:money_goes_brr/authentication/view/login.dart';
import 'package:money_goes_brr/splash_screen.dart';
import 'package:money_goes_brr/user/model/user.dart';
import 'package:money_goes_brr/user/views/user.dart';

import 'authentication/view/sign_in.dart';

import 'package:money_goes_brr/home/views/homeView.dart';
import 'package:money_goes_brr/user/views/edit.dart';
import 'package:money_goes_brr/widgets/graph-3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, a) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      },
    );
  }
}
