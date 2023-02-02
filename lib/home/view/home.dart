import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/homeController.dart';
import '../model/homeModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final content = HomeModel.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: 
        GetX<HomeController>(
        
          //autoRemove: false,
          //assignId: false,
          init: HomeController(),
          initState: (state){ Get.find<HomeController>().obj = content ;},
          builder: (_) {
            return
            _.obj.isEmpty ?
               Center(child: CircularProgressIndicator())
            :
            PageView.builder(
            // separatorBuilder: (context, index) => Divider(height: 1,),
            scrollDirection: Axis.vertical,
            itemCount: content.length,
            itemBuilder: (context, index){
              return ListTile(
                onTap :(){},
                title: Text(content[index].userName),
                subtitle: Text(index.toString()),
              );
            });
          }
        ),
      ),
    );
  }
}