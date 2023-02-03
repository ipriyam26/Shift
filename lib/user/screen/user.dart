import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class User extends StatelessWidget {
  User({super.key});
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];

    List<String> ownedList = [
      'https://images.unsplash.com/photo-1486010586814-abd061e90cf9',
      'https://images.unsplash.com/photo-1497752531616-c3afd9760a11',
      'https://images.unsplash.com/photo-1584900131697-74d0082adc71',
      'https://images.unsplash.com/photo-1498887960847-2a5e46312788',
      'https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d',
      'https://images.unsplash.com/photo-1508849789987-4e5333c12b78',
      'https://images.unsplash.com/photo-1457327289196-f38b88d97147',
      'https://images.unsplash.com/photo-1497752531616-c3afd9760a11',
      'https://images.unsplash.com/photo-1535350356005-fd52b3b524fb',
      'https://images.unsplash.com/photo-1502209524164-acea936639a2',
      'https://images.unsplash.com/photo-1526315274106-ed191ab83b2c',
      'https://images.unsplash.com/photo-1519794206461-cccd885bf209',
    ];

    List<String> savedList = [
      'https://images.unsplash.com/photo-1500835556837-99ac94a94552',
      'https://images.unsplash.com/photo-1513569143478-b38b2c0ef97f',
      'https://images.unsplash.com/photo-1536890992765-f42a1ee1e2a8',
      'https://images.unsplash.com/photo-1535443274868-756b0f070b6e',
      'https://images.unsplash.com/photo-1528642474498-1af0c17fd8c3',
      'https://images.unsplash.com/photo-1492684223066-81342ee5ff30',
      'https://images.unsplash.com/photo-1528357136257-0c25517acfea',
      'https://images.unsplash.com/photo-1521412644187-c49fa049e84d',
      'https://images.unsplash.com/photo-1543304526-6f0ae76a1f8f',
      'https://images.unsplash.com/photo-1542614471-001ccf2b449c',
      'https://images.unsplash.com/photo-1542500186-6edb30855637',
      'https://images.unsplash.com/photo-1542438408-abb260104ef3',
      'https://images.unsplash.com/photo-1542466500-dccb2789cbbb',
    ];
    return Scaffold(
      body: Container(
        color: const Color(0xff282424),
        child: Column(children: [
          const Header(),
          const PurchaseDetails(),
          const BalanceProfit(),
          const Line(),
          Container(
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
                          TabView(imageList: imageList),
                          TabView(imageList: ownedList),
                          TabView(imageList: savedList),
                        ]),
                      ),
                    )
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(alignment: Alignment.bottomRight, children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: CachedNetworkImage(
                  imageUrl: imageList[index],
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

                // FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image: imageList[index],
                //   fit: BoxFit.cover,
                // ),
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
                    child: Text('\$${Random().nextInt(500)}',
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
  const BalanceProfit({
    Key? key,
  }) : super(key: key);

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
              child: const ClickableDetails(
                cost: 456,
                title: "Balance",
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ClickableDetails(
                title: "Profit",
                cost: 10,
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
  const PurchaseDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(top: 28.h, left: 52.w, right: 52.w, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CurrentlyOwned(),
          TotalPurchases(),
        ],
      ),
    );
  }
}

class TotalPurchases extends StatelessWidget {
  const TotalPurchases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Total Purchases",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            )),
        Text(28.toString(),
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: const Color(0xffB548C6),
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class CurrentlyOwned extends StatelessWidget {
  const CurrentlyOwned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Currently Owned",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            )),
        Text(18.toString(),
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontStyle: GoogleFonts.poppins().fontStyle,
              color: const Color(0xffB548C6),
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 94.h,
        margin: EdgeInsets.only(top: 59.h),
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ProfilePicture(),
              NameCaption(),
              EditProfile(),
            ]));
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("User Name",
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontStyle: GoogleFonts.roboto().fontStyle,
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              )),
          Text("Caption",
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.only(right: 1.w),
        color: const Color(0xffB548C6),
        child: ClipOval(
          child: CachedNetworkImage(
            height: 82.h,
            width: 82.w,
            imageUrl: "https://picsum.photos/250?image=9",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
