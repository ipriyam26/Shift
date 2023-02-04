import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:shimmer/shimmer.dart';

class PostScreen extends StatelessWidget {
  UserController user = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282424),
      appBar: AppBar(
          backgroundColor: const Color(0xff252836),
          elevation: 0,
          toolbarHeight: 40.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              GestureDetector(
                  child: Text(
                "Post",
                style:
                    TextStyle(color: const Color(0xffB548C6), fontSize: 16.sp),
              ))
            ],
          )),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h),
          child: Column(
            children: [
              // use shimmer colors as placeholder for this cachednetwork image
              Row(
                
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: const Color(0xffB548C6),
                          padding: EdgeInsets.all(1.w),
                          child: CachedNetworkImage(
                            imageUrl: user.user.value.imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 54.h,
                              width: 54.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(0, 106, 106, 108),
                                highlightColor:
                                    const Color.fromARGB(0, 123, 123, 124),
                                child: Container(
                                  height: 54.h,
                                  width: 54.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        height: 40.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.user.value.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: 17.sp),
                            ),
                            Text(
                              user.user.value.caption,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d",
                      height: 61.h,
                      width: 61.w,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
