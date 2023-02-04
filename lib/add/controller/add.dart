import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:money_goes_brr/constant.dart';
import 'package:video_compress/video_compress.dart';

class AddController extends GetxController {
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
}
