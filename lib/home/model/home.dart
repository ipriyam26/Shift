import 'package:equatable/equatable.dart';
import 'package:money_goes_brr/home/model/post.dart';

class HomeModel extends Equatable {
  final List<Post> contentUrl;
  final String userName;
  final String userprofileUrl;
  final String userGenere;
  final bool isVerified;

  const HomeModel(
      {required this.contentUrl,
      required this.userName,
      required this.userprofileUrl,
      required this.userGenere,
      required this.isVerified});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      contentUrl: (json['contentUrl'] as List).map((e) => Post.fromJson(e)).toList(),
      userName: json['userName'],
      userprofileUrl: json['userprofileUrl'],
      userGenere: json['userGenere'],
      isVerified: json['isVerified'],
    );
  }
  

  static List<HomeModel> items = [
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "1").toList(),
        userName: "sahilsharma",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "2").toList(),
        userName: "priyamsrivastava",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "Creator",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "3").toList(),
        userName: "sumrantalreja",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "4").toList(),
        userName: "jassisingh",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "5").toList(),
        userName: "raj",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "6").toList(),
        userName: "GlitterGoddess23",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "7").toList(),
        userName: "GalacticExplorer69",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "8").toList(),
        userName: "RainbowUnicorn45",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "9").toList(),
        userName: "CyberSpartan",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "10").toList(),
        userName: "PixelPanda92",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "11").toList(),
        userName: "StarryNight77",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "12").toList(),
        userName: "CosmicCactus",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "13").toList(),
        userName: "PixelPanda92",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true),
    HomeModel(
        contentUrl: Post.items.where((item) => item.userId == "14").toList(),
        userName: "LunarLioness",
        userprofileUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        userGenere: "userGenere",
        isVerified: true)
  ];

  @override
  List<Object?> get props => [
        contentUrl,
        userName,
        userprofileUrl,
        userGenere,
        isVerified,
      ];
}
