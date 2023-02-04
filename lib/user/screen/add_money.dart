import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddMoney extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff282424),
      appBar: AppBar(
          backgroundColor: const Color(0xff252836),
          elevation: 0,
          toolbarHeight: 80.h,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cancel" , style: TextStyle(color: Colors.white,fontSize: 16.sp),),
              Text("Add Money" , style: TextStyle(color: Colors.white,fontSize: 16.sp),),

              GestureDetector(child: Text("Post" , style: TextStyle(color: const Color(0xffB548C6),fontSize: 16.sp),))

            ],
          ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Amount" , style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white),),
            SizedBox(height: 20.h),
            CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                cardType: CardType.masterCard, // Optional if you want to override Card Type
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                textExpDate: 'Exp. Date',
                textName: 'Name',
                textExpiry: 'MM/YY'
            ),

            SizedBox(height : 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text("UPI Id" , style: TextStyle(color: Colors.white),),
                Text("7364364@paytm" , style: TextStyle(color: Colors.white),)
              ],
            ),
            SizedBox(height: 20.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 300.h,),
                Padding(
                  padding:  EdgeInsets.only(left :28.w),
                  child: Container(
                    width: 304.w,
                    child: Center(child: Text("Add Money" , style: TextStyle(color: Colors.white),)),
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Color(0xffB548C6),
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))
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
