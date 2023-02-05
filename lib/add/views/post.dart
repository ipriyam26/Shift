import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/user/controller/user.dart';
class PostScreen extends StatelessWidget {

  UserController user  = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282424),

      appBar: AppBar(
        backgroundColor: const Color(0xff252836),
        elevation: 0,
        toolbarHeight: 80.h,
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cancel" , style: TextStyle(color: Colors.white,fontSize: 16.sp),),
            GestureDetector(child: Text("Post" , style: TextStyle(color: const Color(0xffB548C6),fontSize: 16.sp),))

          ],
        )
    ),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: 12.sp,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(
                   children: [
                     Container(
                       width: 54.w,
                       height: 54.h,
                       decoration: BoxDecoration(
                         border: Border.all(color: const Color(0xffF6800D),width: 2.sp),
                         color: Colors.white,
                         // borderRadius: BorderRadius.all(Radius.circular(12.sp)),

                         shape: BoxShape.circle,

                       ),
                     ),
                     SizedBox(width: 12.w,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(user.user.value.name , style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                         Text("Creator",style: TextStyle(color: Colors.white,fontSize: 16.sp))
                       ],
                     ),
                   ],
                 ),

                 Container(
                   width: 61.w,
                   height: 61.h,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       image: DecorationImage(image: AssetImage(
                         user.user.value.imageUrl
                       )),
                       borderRadius: BorderRadius.all(Radius.circular(12.sp))
                   ),
                 ),
               ],
             ),

              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Padding(
                  padding:  EdgeInsets.all(16.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Caption" , style: TextStyle(color: Colors.white,fontSize: 16.sp , fontWeight: FontWeight.w500),),
                     SizedBox(width: 10.w,),
                     Container(
                       child: const Expanded(child: TextField(
                         maxLines: 5,

                         decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.white),
                           ),
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.white),
                           ),
                         ),
                       ),),
                     )
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding:  EdgeInsets.only(left: 20.w,top: 20.h),
                child: Text("Add Price Tag",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16.sp),),
              ),
              SizedBox(height: 20.sp,),
              Padding(
                padding:  EdgeInsets.all(20.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff303137),

                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  width: 339.w,
                  height: 60.h,

                  child: Row(
                    children: [
                      Container(
                        width: 58.w,

                        decoration: BoxDecoration(
                          color: Colors.black,
                          

                          borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                        ),
                        height: 60.h,
                        child: const Icon(Icons.cabin_sharp),
                      ),
                    ],
                  )
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
