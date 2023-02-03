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

  @override
  List<Object?> get props =>
      [postUrl, postPrice, postCaption, shareableLink, postLikes,postId,userId];
}

enum PostType {
  video,
  image,
}
