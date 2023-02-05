// ignore: file_names
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_goes_brr/home/controller/homeController.dart';
import 'package:money_goes_brr/home/model/post.dart';

import '../../add/controller/add.dart';
import '../../add/views/post.dart';
import '../../user/controller/user.dart';
import '../model/home.dart';
import '../widgets/video_player_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final postItem = Post.items;
  final userItem = HomeModel.items;
  final myController = TextEditingController();
  bool enabled = false;
  HomeController homeController = Get.put(HomeController());
  UserController userController = Get.put(UserController());
  AddController addController = Get.put(AddController());

  Widget buildPopupDialogGraph(BuildContext context, int index) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: const Color(0xff252836),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Purchase Cost",
            style: TextStyle(color: Color(0xffB548C6), fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 111.h,
            width: 308.w,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 10,
                backgroundColor: Colors.transparent,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 4),
                      const FlSpot(1, 6),
                      const FlSpot(2, 8),
                      const FlSpot(3, 6.2),
                      const FlSpot(4, 6),
                      const FlSpot(5, 8),
                      const FlSpot(6, 9),
                      const FlSpot(7, 7),
                      const FlSpot(8, 6),
                      const FlSpot(9, 7.8),
                      const FlSpot(10, 8),
                    ],
                    isCurved: true,
                    gradient: const LinearGradient(
                      colors: [Color(0xffB548C6), Color(0xffB548C6)],
                    ),
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffB548C6).withOpacity(0.32),
                          Color(0xff161819),
                        ],
                      ),
                    ),
                    dotData: FlDotData(show: true),
                  ),
                ],
                gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: false,
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.transparent,
                        strokeWidth: 0.8,
                      );
                    }),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 12,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 1:
                              text = "50";
                              break;
                            case 2:
                              text = "100";
                              break;
                            case 3:
                              text = "150";
                              break;
                            case 4:
                              text = "200";
                              break;

                            default:
                              return Container();
                          }
                          return Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          );
                        }),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 12,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 1:
                              text = "";
                              break;
                            case 2:
                              text = "12:00";
                              break;
                            case 3:
                              text = "14:00";
                              break;
                            case 4:
                              text = "13:00";
                              break;
                            case 5:
                              text = "16:00";
                              break;
                            case 6:
                              text = "14:00";
                              break;
                            case 7:
                              text = "7";
                              break;
                            case 8:
                              text = "15:00";
                              break;
                            case 9:
                              text = "9";
                              break;
                            case 10:
                              text = "16:00";
                              break;
                            default:
                              return Container();
                          }
                          return Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Past Purchases",
            style: TextStyle(color: Color(0xffB548C6), fontWeight: FontWeight.w700),
          ),
        ],
      ),
      //   content: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Container(
      //       height: 150,
      //       child: ,
      // ),
      // ],
      // ),
    );
  }

  Widget buildPopupDialog2(BuildContext context, int index) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: const Color(0xff252836),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: postItem[index].postCaption,
            // controller: myController,
          ),
          TextFormField(
            initialValue: postItem[index].postCaption,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 32.h,
                  width: 65.w,
                  decoration: const BoxDecoration(
                      color: Color(0xffB548C6), borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                      child: Text(
                    "YES",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
              const SizedBox(
                width: 33,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 32.h,
                  width: 65.w,
                  decoration: const BoxDecoration(
                      color: Color(0xffB548C6), borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                      child: Text(
                    "NO",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Image'),
                  onTap: () async {
                    var f = await addController.pickimagefromgallery();
                    addController.pickedFile.value = f;
// go to post screen
                    addController.pickedFile.refresh();
                    Get.to(() => PostScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.video_collection),
                  title: const Text('Video'),
                  onTap: () async {
                    addController.isVideoo.value = true;
                    addController.isVideoo.refresh();
                    var f = await addController.pickvideofromgallery();
                    addController.pickedFile.value = f;
                    var thumbnail = await addController.getThumbnail(f!);
                    addController.thumbnail.value = thumbnail;

                    addController.pickedFile.refresh();
                    addController.thumbnail.refresh();

                    print(thumbnail.path);
                    Get.to(() => PostScreen());
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _buildPopupDialog(BuildContext context, int index) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: const Color(0xff252836),
      content: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 202.w,
                child: const Text(
                  "Are you sure you want to buy this?",
                  maxLines: 2,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                )),
            Container(
              height: 34.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => buildPopupDialog2(context, index),
                    );
                  },
                  child: Container(
                    height: 32.h,
                    width: 65.w,
                    decoration: const BoxDecoration(
                        color: Color(0xffB548C6), borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Center(
                        child: Text(
                      "YES",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                SizedBox(
                  width: 33.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 32.h,
                    width: 65.w,
                    decoration: const BoxDecoration(
                        color: Color(0xffB548C6), borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Center(
                        child: Text(
                      "NO",
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: PageView.builder(
            itemCount: postItem.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context, builder: (BuildContext context) => buildPopupDialogGraph(context, index));
                },
                child: Stack(
                  children: [
                    postItem[index].postType == PostType.image
                        ? Container(
                            height: 1.sh,
                            width: 1.sw,
                            decoration:
                                BoxDecoration(image: DecorationImage(image: NetworkImage(postItem[index].postUrl))),
                          )
                        : VideoPlayerItem(videoUrl: postItem[index].postUrl),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, top: 49),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2), // Border width
                            decoration: const BoxDecoration(color: Color(0xffF6800D), shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(35), // Image radius
                                child: Image.network(userItem[int.parse(postItem[index].userId)].userprofileUrl,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10.h,
                              ),
                              Text(
                                userItem[int.parse(postItem[index].userId)].userName,
                                style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                userItem[int.parse(postItem[index].userId)].userGenere,
                                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(children: [
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      _showModalBottomSheet(context);
                                    },
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 30,
                                    )))
                          ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 120.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(postItem[index].postCaption as String,
                            style: const TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 315.w,
                          height: 74.h,
                          decoration: const BoxDecoration(
                              color: Color(0xff252836), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => _buildPopupDialog(context, index),
                                    );
                                  },
                                  child: Stack(
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
                                        child: Text('${postItem[index].postPrice}',
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
                                  ),
                                ),
                                SizedBox(
                                  width: 33.82.w,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                SizedBox(
                                  width: 33.82.w,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                SizedBox(
                                  width: 33.82.w,
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: Image(height: 24.32, width: 16.25, image: AssetImage("assets/save.png"))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    //  Container(
                    //   height: 100,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(),
                    //     image: DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: NetworkImage(userItem[int.parse(postItem[index].userId)].userprofileUrl))
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

