import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/home/model/post.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:money_goes_brr/user/views/profit.dart';
import 'package:shimmer/shimmer.dart';

import '../model/user.dart';

class UserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff282424),
        child: Column(children: [
          Header(),
          PurchaseDetails(),
          BalanceProfit(),
          const Line(),
          const TabViewWidget()
        ]),
      ),
    );
  }
}

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h,
      child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              ButtonsTabBar(
                decoration: BoxDecoration(
                    color: const Color(0xffB548C6),
                    borderRadius: BorderRadius.circular(12.r)),
                unselectedBackgroundColor: Colors.transparent,
                unselectedLabelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                buttonMargin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                tabs: const [
                  Tab(text: "History"),
                  Tab(text: "Owned"),
                  Tab(text: "Saved"),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: TabBarView(children: [
                    TabView(
                      type: TabType.history,
                    ),
                    TabView(
                      type: TabType.owned,
                    ),
                    TabView(
                      type: TabType.saved,
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}

enum TabType { history, owned, saved }

class TabView extends StatelessWidget {
  TabView({
    Key? key,
    required this.type,
  }) : super(key: key);

  final TabType type;

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(builder: (controller) {
      var data = type == TabType.history
          ? controller.user.value.history.historyItems
          : type == TabType.owned
              ? controller.user.value.currentOwned.currentOwnedItems
              : controller.user.value.saved.savedItems;
      return MasonryGridView.count(
          padding: const EdgeInsets.only(top: 0.0),
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5.w),
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(alignment: Alignment.bottomRight, children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: data[index].postThumbnail,
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                if (data[index].postType == PostType.video)
                  Positioned(
                    bottom: 5.h,
                    left: 5.h,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                Stack(
                  alignment: Alignment.centerLeft,
                  fit: StackFit.passthrough,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 32.h,
                      width: 65.w,
                      margin: EdgeInsets.only(right: 4.w, bottom: 7.h),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xffB548C6),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text('\$${data[index].postPrice}',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Positioned(
                      left: -6.w,
                      bottom: 3.h,
                      child: Image.asset(
                        'assets/tag.png',
                        height: 20.h,
                        width: 20.w,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ]),
            );
          });
    });
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17.h, horizontal: 22.w),
      height: 1.w,
      color: Colors.white,
    );
  }
}

class BalanceProfit extends StatelessWidget {
  BalanceProfit({
    Key? key,
  }) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 87.h,
        margin: EdgeInsets.symmetric(horizontal: 22.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              splashColor: const Color(0xffB548C6),
              child: ClickableDetails(
                cost: userController.user.value.currentBalance.balance,
                title: "Balance",
              ),
            ),
            InkWell(
              onTap: () {
                // Get.to(() => Profit());
              },
              child: ClickableDetails(
                title: "Profit",
                cost: userController.user.value.profit.profit,
              ),
            )
          ],
        ));
  }
}

class ClickableDetails extends StatelessWidget {
  const ClickableDetails({
    required this.title,
    required this.cost,
    Key? key,
  }) : super(key: key);

  final double cost;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff303137),
      borderRadius: BorderRadius.circular(10.r),
      elevation: 30,
      child: SizedBox(
        width: 158.w,
        height: 85.h,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("\$$cost",
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontStyle: GoogleFonts.poppins().fontStyle,
                color: const Color(0xffB548C6),
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              )),
          Text(title,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontStyle: GoogleFonts.poppins().fontStyle,
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              )),
        ]),
      ),
    );
  }
}

class PurchaseDetails extends StatelessWidget {
  PurchaseDetails({
    Key? key,
  }) : super(key: key);
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        margin: EdgeInsets.only(top: 28.h, left: 10.w, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CurrentlyOwned(
                count: controller
                    .user.value.currentOwned.currentOwnedItems.length),
            TotalPurchases(
                count: controller.user.value.history.historyItems.length),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipOval(
                  child: SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: Image.asset(
                      'assets/coin.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class TotalPurchases extends StatelessWidget {
  const TotalPurchases({
    required this.count,
    Key? key,
  }) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total Purchases",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            )),
        Text(count.toString(),
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: const Color(0xffB548C6),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class CurrentlyOwned extends StatelessWidget {
  const CurrentlyOwned({
    required this.count,
    Key? key,
  }) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Currently Owned",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            )),
        Text(count.toString(),
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: const Color(0xffB548C6),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
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
                  const EditProfile(),
                ]);
          },
        ));
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.edit_location_alt,
          color: Colors.white,
          size: 28.sp,
        ));
  }
}

class NameCaption extends StatelessWidget {
  const NameCaption({
    required this.name,
    required this.caption,
    Key? key,
  }) : super(key: key);
  final String name;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontStyle: GoogleFonts.roboto().fontStyle,
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              )),
          Text(caption,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontStyle: GoogleFonts.roboto().fontStyle,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.only(right: 1.w),
        color: const Color(0xffB548C6),
        child: ClipOval(
          child: GetX<UserController>(builder: (controller) {
            return CachedNetworkImage(
              height: 82.h,
              width: 82.w,
              imageUrl: controller.user.value.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          }),
        ),
      ),
    );
  }
}
