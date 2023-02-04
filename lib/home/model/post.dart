import 'package:equatable/equatable.dart';

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

  const Post({
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
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId: 1,userId: 1),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:2,userId: 1),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:3,userId: 2),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:4,userId: 2),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:5,userId: 3),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:6,userId: 3),
    Post(postUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", postPrice: 100, postCaption: "postCaption", shareableLink: "shareableLink", postLikes: 100, postType: PostType.video,postId:7,userId: 4),
  ];

  @override
  List<Object?> get props => [
        postUrl,
        postPrice,
        postCaption,
        shareableLink,
        postLikes,
        postId,
        userId,
        postThumbnail,
        postOwner
      ];
}

enum PostType {
  video,
  image,
}
