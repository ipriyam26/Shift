import 'package:equatable/equatable.dart';
import 'package:money_goes_brr/user/model/user.dart';

class Post extends Equatable {
  final String postId;
  final String userId;
  final String postUrl;
  final double postPrice;
  final String? postCaption;
  final int postLikes;
  final String shareableLink;
  final DateTime? postDate;
  final PostType? postType;
  final String postThumbnail;
  final String? postOwner;
  final List<Transactions>? transactions;

  const Post({
    required this.transactions,
    required this.postOwner,
    required this.postThumbnail,
    required this.postId,
    required this.userId,
    required this.postUrl,
    required this.postPrice,
    required this.postCaption,
    required this.shareableLink,
    required this.postLikes,
    required this.postType,
    required this.postDate,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      userId: json['userId'],
      postUrl: json['postUrl'],
      postPrice: json['postPrice'].toDouble(),
      postCaption: json['postCaption'],
      postLikes: json['postLikes'],
      shareableLink: json['shareableLink'],
      postDate: json['postDate'] != null
          ? DateTime.parse(json['postDate'])
          : null,
      postType: json['postType'] != null ? _postTypeFromJson(json['postType']) : null,
      postThumbnail: json['postThumbnail'],
      postOwner: json['postOwner'], transactions: [],
    );
  }

  static PostType? _postTypeFromJson(String postType) {
    switch (postType) {
      case 'Image':
        return PostType.image;
      case 'Video':
        return PostType.video;
      default:
        return null;
    }
  }


  static List<Post> items = const [
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 100,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 200,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 50,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 150,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 80,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 75,
        postCaption: "postCaption",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: []),
  ];

  @override
  List<Object?> get props =>
      [postUrl, postPrice, postCaption, shareableLink, postLikes, postId, userId, postThumbnail, postOwner];
}

enum PostType {
  video,
  image,
}
