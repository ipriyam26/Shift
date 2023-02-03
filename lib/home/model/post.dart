import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int postId;
  final int userId;
  final String postUrl;
  final double postPrice;
  final String? postCaption;
  final int postLikes;
  final String shareableLink;
  
  final PostType postType;

  const Post({
    this.postId = 0,
    this.userId = 0,
    required this.postUrl,
    required this.postPrice,
    required this.postCaption,
    required this.shareableLink,
    required this.postLikes,
    required this.postType,
  });

  static List<Post> items = const [
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId: 1,userId: 1),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:2,userId: 1),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:3,userId: 2),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:4,userId: 2),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:5,userId: 3),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:6,userId: 3),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:7,userId: 4),
  ];

  @override
  List<Object?> get props =>
      [postUrl, postPrice, postCaption, shareableLink, postLikes,postId,userId];
}

enum PostType {
  video,
  image,
}
