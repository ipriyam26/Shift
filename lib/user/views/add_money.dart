import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/user/controller/user.dart';

class AddMoney extends StatelessWidget {

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    double coin = 0.0;

    return Scaffold(
      backgroundColor: const Color(0xff282424),
      appBar: AppBar(
        backgroundColor: const Color(0xff252836),
        elevation: 0,
        toolbarHeight: 59.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Text(
              "Add Money",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            Text(
              "Done",
              style: TextStyle(color: const Color(0xff252836), fontSize: 16.sp),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Amount",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
                height: 52.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),

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
                          coin = double.parse(value);
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                        decoration: InputDecoration(
                            // set offest of text field to right side
                            contentPadding:
                                EdgeInsets.only(left: 70.w, top: 10.h),

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
            SizedBox(height: 30.h),
            CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                cardType: CardType
                    .masterCard, // Optional if you want to override Card Type
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                textExpDate: 'Exp. Date',
                textName: 'Name',
                textExpiry: 'MM/YY'),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "UPI Id",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "7364364@paytm",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                InkWell(
                  onTap: () {
                    print(coin);
                    userController.addMoney(coin);
                    Get.back();
                },
                  child: Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Container(
                      width: 304.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffB548C6),
                          borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                      child: const Center(
                          child: Text(
                        "Add Money",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
