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
