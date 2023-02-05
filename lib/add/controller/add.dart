import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_goes_brr/constant.dart';
import 'package:money_goes_brr/home/model/post.dart';
import 'package:money_goes_brr/user/controller/user.dart';
import 'package:video_compress/video_compress.dart';
import 'package:permission_handler/permission_handler.dart';

class AddController extends GetxController {
  final _imagepicker = ImagePicker();
  final pickedFile = Rxn<File>();
  final isVideoo = false.obs;
  final thumbnail = Rxn<File>();
  final caption = "".obs;
  final priceTag = 0.0.obs;
  final isLoading = false.obs;
  final UserController userController = Get.find<UserController>();

  Future<String> uploadVideo(File video) async {
    var request =
        http.MultipartRequest(Constants().post, Uri.parse(Constants().posturl));
    request.headers["Authorization"] = Constants().clientID;
    var file = await http.MultipartFile.fromPath(
      "video",
      video.path,
    );

    request.files.add(file);
    var response = await request.send();
    var result = await http.Response.fromStream(response)
        .then((value) => jsonDecode(value.body));
    var data = result["data"];
    // print(Constants().baseurl + data["id"] + Constants().ext);
    return Constants().baseurl + data["id"] + Constants().videoExt;
    // idList.add(data["id"]);
  }

  Future<File?> pickimagefromgallery() async {
    if (!await Permission.storage.isGranted) {
      await Permission.storage.request();
      Get.snackbar("Error", "No permission granted",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }
    final pickedFile = await _imagepicker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile == null) {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }
    return File(pickedFile.path);
  }

  Future<File?> pickvideofromgallery() async {
    if (!await Permission.storage.isGranted) {
      await Permission.storage.request();
      Get.snackbar("Error", "No permission granted",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }

    final pickedFile = await _imagepicker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 30));

    if (pickedFile == null) {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return null;
    }
    print(pickedFile.path);
    return File(pickedFile.path);
  }

  Future<String> uploadImage(File image) async {
    var request =
        http.MultipartRequest(Constants().post, Uri.parse(Constants().posturl));
    request.headers["Authorization"] = Constants().clientID;
    var file = await http.MultipartFile.fromPath(
      "image",
      image.path,
    );
    request.files.add(file);
    var response = await request.send();
    var result = await http.Response.fromStream(response)
        .then((value) => jsonDecode(value.body));
    var data = result["data"];
    // print(Constants().baseurl + data["id"] + Constants().ext);
    return Constants().baseurl + data["id"] + Constants().ext;
    // idList.add(data["id"]);
  }

  bool isVideo(File file) {
    String fileType = file.path.split('.').last;
    if (fileType == 'jpg' || fileType == 'jpeg' || fileType == 'png') {
      return false;
    }
    return true;
  }

  Future<File> getThumbnail(File file) async {
    final thumbnailFile = await VideoCompress.getFileThumbnail(file.path,
        quality: 50, // default(100)
        position: -1 // default(-1)
        );
    return thumbnailFile;
  }

  Future<File> compressVideo(File file) async {
    final info = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.LowQuality,
      deleteOrigin: false, // It's false by default
    );
    return File(info!.path!);
  }

  Future<void> createPost() async {
    if (caption.value.isEmpty) {
      Get.snackbar("Error", "Caption cannot be empty",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return;
    }
    if (priceTag.value == 0) {
      Get.snackbar("Error", "Price cannot be empty",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      return;
    }
    isLoading.value = true;
    isLoading.refresh();
    String user = userController.user.value.id;
    var body = {};
    if (isVideoo.value) {
      var Url = await uploadVideo(pickedFile.value!);

      var thumbnailUrl = await uploadImage(thumbnail.value!);

      body = {
        "post": Post(
                transactions: [],
                postOwner: user,
                postThumbnail: thumbnailUrl,
                postId: "",
                userId: user,
                postUrl: Url,
                postPrice: priceTag.value,
                postCaption: caption.value,
                shareableLink: Url,
                postLikes: 0,
                postType: PostType.video,
                postDate: DateTime.now())
            .toJson()
      };
    } else {
      var Url = await uploadImage(pickedFile.value!);

      body = {
        "post": Post(
                transactions: [],
                postOwner: user,
                postThumbnail: Url,
                postId: "",
                userId: user,
                postUrl: Url,
                postPrice: priceTag.value,
                postCaption: caption.value,
                shareableLink: Url,
                postLikes: 0,
                postType: PostType.image,
                postDate: DateTime.now())
            .toJson()
      };
    }
    // validate price to be a number and caption to be not empty using regex and get snackbar if not valid

    // create post here
    // now push post from here
//create post request to api

    print(json.encode(body));
    var response = await http.post(
        Uri.parse('https://icosmic.onrender.com/posts'),
        body: json.encode(body));
    if (response.statusCode == 200) {
      print(response.body);
    } 

    isLoading.value = false;
    isLoading.refresh();

    Get.back();
  }

// create post
}
