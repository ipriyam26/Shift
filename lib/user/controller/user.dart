import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_goes_brr/constant.dart';
import 'package:money_goes_brr/home/model/post.dart';
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

      List<String> ownedList = [
        'https://images.unsplash.com/photo-1486010586814-abd061e90cf9',
        'https://images.unsplash.com/photo-1497752531616-c3afd9760a11',
        'https://images.unsplash.com/photo-1584900131697-74d0082adc71',
        'https://images.unsplash.com/photo-1498887960847-2a5e46312788',
        'https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d',
        'https://images.unsplash.com/photo-1508849789987-4e5333c12b78',
        'https://images.unsplash.com/photo-1457327289196-f38b88d97147',
        'https://images.unsplash.com/photo-1497752531616-c3afd9760a11',
        'https://images.unsplash.com/photo-1535350356005-fd52b3b524fb',
        'https://images.unsplash.com/photo-1502209524164-acea936639a2',
        'https://images.unsplash.com/photo-1526315274106-ed191ab83b2c',
        'https://images.unsplash.com/photo-1519794206461-cccd885bf209',
      ];
      List<String> historyList = [
        'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
        'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
        'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
        'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
        'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
        ...ownedList
      ];

      List<String> savedList = [
        'https://images.unsplash.com/photo-1500835556837-99ac94a94552',
        'https://images.unsplash.com/photo-1513569143478-b38b2c0ef97f',
        'https://images.unsplash.com/photo-1536890992765-f42a1ee1e2a8',
        'https://images.unsplash.com/photo-1535443274868-756b0f070b6e',
        'https://images.unsplash.com/photo-1528642474498-1af0c17fd8c3',
        'https://images.unsplash.com/photo-1492684223066-81342ee5ff30',
        'https://images.unsplash.com/photo-1528357136257-0c25517acfea',
        'https://images.unsplash.com/photo-1521412644187-c49fa049e84d',
        'https://images.unsplash.com/photo-1543304526-6f0ae76a1f8f',
        'https://images.unsplash.com/photo-1542614471-001ccf2b449c',
        'https://images.unsplash.com/photo-1542500186-6edb30855637',
        'https://images.unsplash.com/photo-1542438408-abb260104ef3',
        'https://images.unsplash.com/photo-1542466500-dccb2789cbbb',
      ];

      List<Post> savedItems = savedList.map((e) {
        var t = Random().nextInt(10);

        return Post(
          userId: Random().nextInt(100000).toString(),
          postId: Random().nextInt(100000).toString(),
          postThumbnail: e,
          postUrl: e,
          postPrice: Random().nextDouble() * 100,
          postCaption: "I am a software developer",
          postOwner: "John Doe",
          postDate: DateTime.now(),
          postLikes: 5,
          postType: t % 2 == 0 ? PostType.image : PostType.video,
          shareableLink: "",
          transactions: [],
        );
      }).toList();

      List<Post> ownedItems = ownedList.map((e) {
        var t = Random().nextInt(10);

        return Post(
          userId: Random().nextInt(100000).toString(),
          postId: Random().nextInt(100000).toString(),
          postThumbnail: e,
          postUrl: e,
          postPrice: Random().nextDouble() * 100,
          postCaption: "I am a software developer",
          postOwner: "John Doe",
          postDate: DateTime.now(),
          postLikes: 5,
          postType: t % 2 == 0 ? PostType.image : PostType.video,
          shareableLink: "",
          transactions: [],
        );
      }).toList();

      List<Post> historyItems = historyList.map((e) {
        var t = Random().nextInt(10);

        return Post(
          userId: Random().nextInt(100000).toString(),
          postId: Random().nextInt(100000).toString(),
          postThumbnail: e,
          postUrl: e,
          postPrice: Random().nextDouble() * 100,
          postCaption: "I am a software developer",
          postOwner: "John Doe",
          postDate: DateTime.now(),
          postLikes: 5,
          postType: t % 2 == 0 ? PostType.image : PostType.video,
          shareableLink: "",
          transactions: [],
        );
      }).toList();

      List<PostTransaction> postTransactions = historyItems.map((e) {
        return PostTransaction(
          post: e,
          purchase: Transactions(
            transactionId: Random().nextInt(100000).toString(),
            transactionDate: DateTime.now(),
            transactionAmount: Random().nextInt(200).toDouble(),
            transactionType: TransactionType.bought,
          ),
          sale: Transactions(
            transactionId: Random().nextInt(100000).toString(),
            transactionDate: DateTime.now(),
            transactionAmount: Random().nextInt(200).toDouble(),
            transactionType: TransactionType.sold,
          ),
          isSold: true,
        );
      }).toList();
// for each post transaction find profit or loss and add it all up

      var profit = postTransactions.fold(0.0, (previousValue, element) {
        var profit =
            element.sale.transactionAmount - element.purchase.transactionAmount;
        return previousValue + profit;
      });

      user.value.profit =
          Profit(profit: profit, transactions: postTransactions);
      user.value.saved = Saved(savedItems: savedItems);
      user.value.currentOwned = CurrentOwned(currentOwnedItems: ownedItems);
      user.value.history = History(historyItems: historyItems);
      user.refresh();
      refresh();
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
  }

  buyItem(Post post) {
//only allow purchase if user has enough balance
    if (user.value.currentBalance.balance < post.postPrice) {
      Get.snackbar("Error", "Insufficient balance",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }
    Post newPost = Post(
      userId: user.value.id,
      postId: Random().nextInt(100000).toString(),
      postThumbnail: post.postThumbnail,
      postUrl: post.postUrl,
      postPrice: post.postPrice,
      postCaption: post.postCaption,
      postOwner: user.value.name,
      postDate: post.postDate,
      postLikes: post.postLikes,
      postType: post.postType,
      shareableLink: "",
      transactions: [],
    );
// add post to user history and also to currently owned reduce balance by post price
    user.value.currentOwned.currentOwnedItems.insert(0, post);
    user.value.history.historyItems.insert(0, post);

    user.value.currentBalance.balance -= post.postPrice;
// create transaction
    var transaction = Transactions(
      transactionId: Random().nextInt(100000).toString(),
      transactionDate: DateTime.now(),
      transactionAmount: post.postPrice,
      transactionType: TransactionType.bought,
    );
// add transaction to post
    post.transactions!.add(transaction);

    user.value.currentBalance.transactions.add(transaction);
    user.refresh();

    Get.snackbar("Success", "Item purchased",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
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
