import 'package:equatable/equatable.dart';
import 'package:money_goes_brr/home/model/videoModel.dart';

class HomeModel extends Equatable{
  final int id;
  final List<Content> content;
  final String userName;
  final String userprofileUrl;
  final String userGenere;
  final bool isVerified;
  
  const HomeModel({
    required this.id,
    required this.content,
    required this.userName,
    required this.userprofileUrl,
    required this.userGenere,
    required this.isVerified
  });

  static List<HomeModel> home = [
    HomeModel(content:  Content.items.where((contentItem) => contentItem.userId == 1).toList(), userName: "userName1", userprofileUrl: "userprofileUrl", userGenere: "userGenere", isVerified: true, id: 1),
    HomeModel(content:  Content.items.where((contentItem) => contentItem.userId == 2).toList(), userName: "userName2", userprofileUrl: "userprofileUrl", userGenere: "userGenere", isVerified: true, id: 2),
    HomeModel(content:  Content.items.where((contentItem) => contentItem.userId == 3).toList(), userName: "userName3", userprofileUrl: "userprofileUrl", userGenere: "userGenere", isVerified: true, id: 3)
  ];
  @override
  List<Object?> get props => [
        content,
        userName,
        userprofileUrl,
        userGenere,
        isVerified,
      ];
}