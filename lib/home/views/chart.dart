import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_goes_brr/home/controller/chart.dart';

class Chart extends StatelessWidget {
  Chart({super.key});

  ChartController chartController = Get.put(ChartController());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LineChart(
      LineChartData(
          // read about it in the LineChartData section
          ),
    ));
  }
}
