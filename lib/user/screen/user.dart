import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/user/controller/user.dart';


class User extends StatelessWidget {
  User({super.key});
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff282424),
        child: Column(children: [
          const Header(),
          const PurchaseDetails(),
          const BalanceProfit(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 17.h, horizontal: 22.w),
            height: 1.w,
            color: Colors.white,
          )
        ]),
      ),
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
