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
