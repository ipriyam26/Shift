import 'package:equatable/equatable.dart';
import 'package:money_goes_brr/home/model/videoModel.dart';

class HomeModel extends Equatable{
  final List<Video> contentUrl;
  final String userName;
  final String userprofileUrl;
  final String userGenere;
  final bool isVerified;
  
  const HomeModel({
    required this.contentUrl,
    required this.userName,
    required this.userprofileUrl,
    required this.userGenere,
    required this.isVerified
  });

  @override
  List<Object?> get props => [
        contentUrl,
        userName,
        userprofileUrl,
        userGenere,
        isVerified,
        
      ];
}