import 'package:get/get.dart';

class ChartData {
  ChartData(this.title, this.x, this.y);
  final String title;
  final double x;
  final double y;
}

class ChartController extends GetxController {
  var data = <ChartData>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    data.value = [
      ChartData('Jan', 1, 35),
      ChartData('Feb', 2, 28),
      ChartData('Mar', 3, 34),
      ChartData('Apr', 4, 32),
      ChartData('May', 5, 40),
    ];

    data.refresh();

    super.onInit();
  }
}
