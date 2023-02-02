
import 'package:equatable/equatable.dart';

class Video extends Equatable{
  final String videoUrl;
  final int videoPrice;
  final String videoCaption;
  final int videoLikes;
  final String shareableLink;
  
  const Video({
    required this.videoUrl,
    required this.videoPrice,
    required this.videoCaption,
    required this.shareableLink,
    required this.videoLikes
  });

  @override
  List<Object?> get props => [
        videoUrl,
        videoPrice,
        videoCaption,
        shareableLink,
        videoLikes
      ];
}