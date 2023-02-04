import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BalanceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff282424),
      body: Padding(
        padding:  EdgeInsets.all(36.sp),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Text("Balance" , style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 22.sp,color: Colors.white ),),
              SizedBox(
                height:20.h
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildRow(title: 'Cash In' ,  color: const Color(0xff23B371)),
                  SizedBox(
                    width: 79.w,
                  ),
                  buildRow(title: 'Sold' ,  color: const Color(0xffF4C300)),

                ],
              ),
              SizedBox(height: 12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildRow(title: 'Cash Out' ,  color: const Color(0xffE63E3E)),
                  SizedBox(
                    width: 70.w,
                  ),
                  buildRow(title: 'Cash Out' ,  color: const Color(0xff3EAAE6)),

                ],
              ),
              SizedBox(
                height: 20.h,
              ),


             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const PaymentRow( bg : Color(0xff23B371), title: 'Transfer',subtitle: 'Bank Transfer',color: Color(0xff23B371),date: "14 Aug, 2022",amount: "980", cashOut: false,),
                 SizedBox(height: 10.h,),
                 const PaymentRow( bg : Color(0xffFC4300), title: 'Digital Payment',subtitle: 'Paying Bills',color: Color(0xff23B371),date: "13 Aug, 2022",amount: "124", cashOut: true,),
                 SizedBox(height: 10.h,),

                 const PaymentRow( bg : Color(0xffE63E3E), title: 'Credit Card',subtitle: 'Food & Drinks',color: Color(0xff23B371),date: "12 Aug, 2022",amount: "321", cashOut: true,),
                 SizedBox(height: 10.h,),

                 const PaymentRow( bg : Color(0xff5D7FBE), title: 'Education',subtitle: 'School Fees',color: Color(0xff23B371),date: "11 Aug, 2022",amount: "214", cashOut: true,),
                 SizedBox(height: 10.h,),

                 const PaymentRow( bg : Color(0xffE63E3E), title: 'Market',subtitle: 'Food Expenditure',color: Color(0xff23B371),date: "14 Aug, 2022",amount: "765", cashOut: true,),
                 SizedBox(height: 10.h,),


                 const PaymentRow( bg : Color(0xffE63E3E), title: 'Transport',subtitle: 'Vacation Trip',color: Color(0xff23B371),date: "10 Aug, 2022",amount: "109", cashOut: true,),
                 SizedBox(height: 10.h,),

                 const PaymentRow( bg : Color(0xff23B371), title: 'Transfer',subtitle: 'Bank Income',color: Color(0xff23B371),date: "09 Aug, 2022",amount: "987", cashOut: false,),
                 SizedBox(height: 30.h,),
                 Padding(
                   padding:  EdgeInsets.only(left: 12.w),
                   child: Container(
                     width: 304.w,
                     height: 52.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffB548C6),
                        borderRadius: BorderRadius.circular(10.r),


                      ),
                     child: Center(child: Text("456₹ " , style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w600),)),
                   ),
                 )
               ],
             )

            ],



          ),
        ),
      ),
    );
  }

  Row buildRow({required String title, required Color color}) {
    return Row(
            children: [
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: (color),
                  borderRadius: BorderRadius.circular(20.sp),

                ),


              ),
              SizedBox(
                width: 8.w,
              ),
              Text(title , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 12.sp , color: Colors.white),)

            ],
          );
  }
}

class PaymentRow extends StatelessWidget {
  const PaymentRow({
    Key? key, required this.title, required this.date, required this.amount, required this.color, required this.subtitle, required this.bg, required this.cashOut
  }) : super(key: key);

  final String title ;
  final String subtitle ;
  final String amount ;
  final Color color ;
  final String date;
  final bool cashOut;
  

  final Color bg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right : 8.sp),
      child: Container(
        width: 359.w,
        height: 66.h,
        decoration: BoxDecoration(
          color: const Color(0xff282424),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff282424).withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],


        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 14.w,right: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 35.34.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(title,style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300,color: Colors.white,),
                      ),
                      SizedBox(height: 5.h,),
                      Text(subtitle,style: TextStyle(color: const Color(0xff83848B),fontSize: 12.sp,fontWeight: FontWeight.w400),)
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(date,style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,color: const Color(0xff83848B)),),
                  SizedBox(height: 5.h,),
                cashOut?   Text( "-₹ $amount",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, color: const Color(0xffE63E3E)),)
                : Text( "+₹ $amount",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp, color: const Color(0xff23B371)),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
