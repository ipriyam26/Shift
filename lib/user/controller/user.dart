import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_goes_brr/constant.dart';
import 'package:permission_handler/permission_handler.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  final updatedImage = Rxn<File>();
  final user = User(
      id: "",
      name: "",
      email: "",
      caption: "",
      imageUrl: "",
      profit: Profit(profit: 0, transactions: []),
      currentBalance: Balance(balance: 0.0, transactions: []),
      history: History(historyItems: []),
      currentOwned: CurrentOwned(currentOwnedItems: []),
      saved: Saved(savedItems: [])).obs;

  static const baseUrl = 'https://icosmic.onrender.com';

  Future<User> fetchUser(String id) async {
    String url = "$baseUrl/users/$id";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response into a User object
      var data = json.decode(response.body);
      print(data);
      user.value = User.fromJson(data);
      user.refresh();
      return user.value;
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to load user');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUser("5917ac8b347");
    refresh();
  }

// update profile picture
  Future<File?> pickimagefromgallery() async {
    if (!await Permission.storage.isGranted) {
      await Permission.storage.request();
      Get.snackbar("Error", "No permission granted",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }
    var _imagepicker = ImagePicker();
    final pickedFile = await _imagepicker.pickImage(source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile == null) {
      Get.snackbar("Error", "No image selected", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }
    updatedImage.value = File(pickedFile.path);
    updatedImage.refresh();
    return File(pickedFile.path);
  }

  Future<bool> addMoney(double n) async {
    user.value.currentBalance.balance += n;
    // create transaction

    var transaction = Transactions(
      transactionAmount: n,
      transactionType: TransactionType.added,
      transactionDate: DateTime.now(),
      transactionId: "",
    ).toJson();

    transaction.addAll({"userId": user.value.id, "postId": ""});

    Uri transactionUri = Uri.parse("${Constants().baseurl}/transactions/");

    print(jsonEncode({"transaction": transaction}));

    var response = await http.post(transactionUri,
        body: jsonEncode({"transaction": transaction}));
    print(response.body);

    user.refresh();
    // send to server
    Uri uri = Uri.parse(Constants().baseurl + "/users/" + user.value.id);
    http.put(uri,
        body: jsonEncode({
          "currentBalance": user.value.currentBalance.toJson(),
        }));

    return true;
  }

  Future<String> uploadImage(File image) async {
    var request = http.MultipartRequest(Constants().post, Uri.parse(Constants().posturl));
    request.headers["Authorization"] = Constants().clientID;
    var file = await http.MultipartFile.fromPath(
      "image",
      image.path,
    );
    request.files.add(file);
    var response = await request.send();
    var result = await http.Response.fromStream(response).then((value) => jsonDecode(value.body));
    var data = result["data"];
    // print(Constants().baseurl + data["id"] + Constants().ext);

    var link = Constants().baseurl + data["id"] + Constants().ext;
// update user image
    return link;
  }

// get all the changed fields and update them
  Future<void> updateProfile() async {
    // update user details convert to json and send to server
  }
}
