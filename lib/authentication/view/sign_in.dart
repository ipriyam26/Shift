import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/authentication/view/login.dart';
// import 'package:waste_not/screens/presentation/signup.dart';

import '../controller/login_controller.dart';

class SignIn extends StatelessWidget {
// put login controller
  final loginController = Get.put(LoginController());

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        padding: EdgeInsets.all(30.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height : 150.h),

              Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    hintText: 'Email or Username ',
                    hintStyle: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: const BorderSide(
                        width: 2,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16.sp),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: const BorderSide(
                        width: 2,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16.sp),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: RichText(

                      textAlign: TextAlign.center,
                      text: TextSpan(

                        children: <TextSpan>[
                           const TextSpan(text: 'By selecting Signup below, I agree to '),

                           const TextSpan(text: 'Terms & \ncondition.', style:  TextStyle(fontWeight: FontWeight.bold,color: Color(0xfff6800D))),
                        ],
                      ),
                  ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.sp),
              //   child: TextFormField(
              //     textAlign: TextAlign.center,
              //     keyboardType: TextInputType.text,
              //     onFieldSubmitted: (value) {},
              //     onChanged: (value) {
              //       email = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Sign In',
              //       hintStyle: TextStyle(
              //         color: Colors.white,
              //         fontSize: 17.sp,
              //         fontWeight: FontWeight.w600,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8.sp),
              //         borderSide: const BorderSide(
              //           width: 2,
              //           style: BorderStyle.none,
              //         ),
              //       ),
              //       filled: true,
              //       contentPadding: EdgeInsets.all(17.sp),
              //       fillColor: Color(0xFFF6800D),
              //     ),
              //   ),
              // ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 48.h,
                    width: 304.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffF6800D),
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.sp))),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffA7998B),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffA7998B),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue With :",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp,color: Colors.white),)
                ],
              ),
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.asset("assets/apple.png"),

                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.sp))),

                  ),
                  Container(
                    child: Image.asset("assets/google.png"),
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.sp))),

                  ),
                  Container(
                    child: Image.asset("assets/fb.png"),

                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.sp))),

                  ),

                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,color: Colors.white),),
                  SizedBox(width: 5.w,),
                  GestureDetector(
                    onTap: (){
                      Get.to(Login());
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                    child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,color: Color(0xffF6800D)),),
                  )
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final void Function(bool) onObscureTextToggled;

  const PasswordTextField({super.key,
    required this.obscureText,
    required this.onObscureTextToggled,
  }) ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () => onObscureTextToggled(!obscureText),
        ),
      ),
    );
  }
}