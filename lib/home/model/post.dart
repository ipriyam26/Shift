import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String postUrl;
  final double postPrice;
  final String? postCaption;
  final int postLikes;
  final String shareableLink;
  
  final PostType postType;

  const Post({
    required this.postUrl,
    required this.postPrice,
    required this.postCaption,
    required this.shareableLink,
    required this.postLikes,
    required this.postType,
  });

  @override
  List<Object?> get props =>
      [postUrl, postPrice, postCaption, shareableLink, postLikes];
}

enum PostType {
  video,
  image,
}
