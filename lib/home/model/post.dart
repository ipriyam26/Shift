import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String postUrl;
  final double postPrice;
  final String? postCaption;
  final int postLikes;
  final String shareableLink;
  final String? postOwner;
  final DateTime? postDate;
  final PostType postType;

  const Post({
    required this.postOwner,
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
        postOwner,
      ];
}

enum PostType {
  video,
  image,
}
