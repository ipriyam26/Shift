import 'dart:convert';

import 'package:get/get.dart';
import 'package:money_goes_brr/home/model/home.dart';
import 'package:http/http.dart' as http;
import 'package:money_goes_brr/user/controller/user.dart';

class HomeController extends GetxController {
  UserController userController = Get.put(UserController());

  final homeuser =
      const HomeModel(contentUrl: [], userName: "", userprofileUrl: "", userGenere: "", isVerified: true).obs;

  static const baseUrl = 'https://icosmic.onrender.com';

  //   Future<HomeModel> fetchContent() async {
  //   String url = baseUrl + "/homemodel"+userController.user.value.id;
  //   print(url);
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     return HomeModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load content');
  //   }
  // }
  //  Future<HomeModel> fetchContent(String id) async {
  //   String url = "$baseUrl/homemodel/$id";
  //   print(url);
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     // If the request was successful, parse the JSON response into a User object
  //     var data = json.decode(response.body);
  //     print(data);
  //     homeuser.value = HomeModel.fromJson(data);
  //     homeuser.refresh();
  //     return homeuser.value;
  //   } else {
  //     // If the request was not successful, throw an exception
  //     throw Exception('Failed to load user');
  //   }
  // }
  //   @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   fetchContent(userController.user.value.id);
  //   refresh();
  // }
}
