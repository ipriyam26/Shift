
import 'package:equatable/equatable.dart';

class Content extends Equatable{
  final int userId;
  final String contentUrl;
  final int contentPrice;
  final String contentCaption;
  final int contentLikes;
  final String shareableLink;
  final bool isVideo;

  const Content({
    required this.userId,
    required this.contentUrl,
    required this.contentPrice,
    required this.contentCaption,
    required this.shareableLink,
    required this.contentLikes,
    required this.isVideo
  });

  static List<Content> items = [
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 1),
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 1),
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 2),
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 2),
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 3),
    Content(contentUrl: "contentUrl", contentPrice: 100, contentCaption: "Hello", shareableLink: "shareableLink", contentLikes: 2, isVideo: true, userId: 3)
  ];

  @override
  List<Object?> get props => [
        contentUrl,
        contentPrice,
        contentCaption,
        shareableLink,
        contentLikes,
        isVideo
      ];
}