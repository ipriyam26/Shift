import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:money_goes_brr/home/model/post.dart';

import '../widgets/video_player_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final postItem = Post.items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: postItem.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
        return Stack(
          children: [
            postItem[index].postType==PostType.image ? Container(
              height: 1.sh,
              width: 1.sw,
              color: Colors.white,
              child: Text(postItem[index].shareableLink),
            ) : VideoPlayerItem(videoUrl: postItem[index].postUrl)
          ],
        );
      }),
    );
  }
}