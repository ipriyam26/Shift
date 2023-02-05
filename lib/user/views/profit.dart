import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/home/model/post.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:money_goes_brr/user/views/user.dart';
import 'package:shimmer/shimmer.dart';

class Profit extends StatelessWidget {
  Profit({super.key});

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var data = userController.user.value.profit.transactions;
    return Scaffold(
      backgroundColor: const Color(0xff282424),
      body: Container(
          child: Column(
        children: [
          Header(),
          Expanded(
            // height: 640.h,
            // width: 350.w,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(left: 33.w, top: 18.h, bottom: 10.h),
                child: Text(
                  "Profit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              ),
              Container(
                height: 595.h,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: GetX<UserController>(builder: (controller) {
                  return MasonryGridView.count(
                      padding: const EdgeInsets.only(top: 0.0),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      itemCount: controller.user.value.profit.transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        var sp = controller.user.value.profit.transactions[index].sale.transactionAmount;
                        var cp = controller.user.value.profit.transactions[index].purchase.transactionAmount;
                        var profit = sp - cp;
                        return Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: const BoxDecoration(
                              color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Stack(alignment: Alignment.bottomRight, children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: CachedNetworkImage(
                                imageUrl: controller.user.value.profit.transactions[index].post.postThumbnail,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => SizedBox(
                                  width: 200.0.w,
                                  height: 300.0.h,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.grey,
                                      height: 300.h,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            if (controller.user.value.profit.transactions[index].post.postType == PostType.video)
                              Positioned(
                                bottom: 5.h,
                                left: 5.h,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                            Container(
                                height: 38.h,
                                width: 92.w,
                                margin: EdgeInsets.only(right: 11.w, bottom: 8.h),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\$$sp",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: GoogleFonts.inter().fontFamily),
                                    ),
                                    if (cp != 0)
                                      Text(
                                        "${profit > 0 ? "+" : ""}${(profit).toStringAsFixed(2)} (${(profit / cp).toStringAsFixed(1)}%)",
                                        style: TextStyle(
                                            color: profit > 0 ? Colors.green : Colors.red,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: GoogleFonts.inter().fontFamily),
                                      )
                                  ],
                                )),
                          ]),
                        );
                      });
                }),
              )
            ]),
            //  child: ,
          ),
        ],
      )),
    );
  }
}

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 94.h,
        margin: EdgeInsets.only(top: 59.h),
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: GetX<UserController>(
          builder: (controller) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(
                    imageUrl: controller.user.value.imageUrl,
                  ),
                  NameCaption(
                    name: controller.user.value.name,
                    caption: controller.user.value.caption,
                  ),
                  Container(
                    width: 32.w,
                  )
                ]);
          },
        ));
  }
}
