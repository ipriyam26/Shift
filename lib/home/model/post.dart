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
  final PostType postType;
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
