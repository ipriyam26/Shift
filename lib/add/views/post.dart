import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/add/controller/add.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:shimmer/shimmer.dart';

class PostScreen extends StatelessWidget {
  UserController userController = Get.put(UserController());
  AddController addController = Get.put(AddController());
  @override
  Widget build(BuildContext context) {
    var textFieldTextStyle = TextStyle(
        color: Colors.white, fontFamily: GoogleFonts.roboto().fontFamily, fontWeight: FontWeight.w400, fontSize: 16.sp);
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
              InkWell(
                  onTap: () {
                    addController.createPost();
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(color: const Color(0xffB548C6), fontSize: 16.sp),
                  ))
            ],
          )),
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 26.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // use shimmer colors as placeholder for this cachednetwork image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Container(
                                color: const Color(0xffB548C6),
                                padding: EdgeInsets.all(1.w),
                                child: CachedNetworkImage(
                                  imageUrl: userController.user.value.imageUrl,
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
                                      baseColor: const Color.fromARGB(0, 106, 106, 108),
                                      highlightColor: const Color.fromARGB(0, 123, 123, 124),
                                      child: Container(
                                        height: 54.h,
                                        width: 54.w,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                      )),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                    userController.user.value.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: GoogleFonts.roboto().fontFamily,
                                        fontSize: 17.sp),
                                  ),
                                  Text(
                                    userController.user.value.caption.length > 25
                                        ? "${userController.user.value.caption.substring(0, 20)}..."
                                        : userController.user.value.caption,
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
                          child: GetX<AddController>(builder: (controller) {
                            print(controller.pickedFile.value);
                            if (controller.pickedFile.value == null) {
                              return Container(
                                height: 61.h,
                                width: 61.w,
                                color: Colors.grey,
                              );
                            }
                            return Image.file(
                              controller.isVideoo.value ? controller.thumbnail.value! : controller.pickedFile.value!,
                              height: 61.h,
                              width: 61.w,
                              fit: BoxFit.cover,
                            );
                          }),
                        )
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Caption",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp),
                          ),
                          SizedBox(
                            width: 240.w,
                            child: TextField(
                              onChanged: (value) {
                                addController.caption.value = value;
                                addController.caption.refresh();
                              },
                              maxLines: null,
                              minLines: null,
                              autocorrect: false,
                              style: textFieldTextStyle,
                              decoration: InputDecoration(
                                // active border color
                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                // normal border color also white
                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                hintText: "What's on your mind?",
                                hintStyle: textFieldTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Price Tag",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp),
                        ),
                        SizedBox(height: 14.h),
                        SizedBox(
                            height: 52.h,
                            // this container contains image of coin in left side and stacked on a text field of grey color to enter amount of coin
                            child: Stack(
                              children: [
                                Container(
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color(0xff252836),
                                  ),
                                  child: TextField(
                                    maxLines: 1,
                                    onChanged: (value) {
                                      addController.priceTag.value = value;
                                      addController.priceTag.refresh();
                                    },
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                                    decoration: InputDecoration(
                                        // set offest of text field to right side
                                        contentPadding: EdgeInsets.only(left: 70.w, top: 10.h),

                                        // active border color
                                        focusedBorder: InputBorder.none,
                                        // normal border color also white
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    "assets/coin.png",
                                    height: 52.h,
                                    width: 52.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              )),
          GetX<AddController>(builder: (controller) {
            if (controller.isLoading.value) {
              return Container(
                color: Colors.black.withOpacity(0.6),
                width: double.infinity,
                child: Center(
                    child: SpinKitSpinningLines(
                  color: const Color(0xffB548C6),
                  size: 70.sp,
                )),
              );
            }
            return Container();
          })
        ],
      ),
    );
  }
}
