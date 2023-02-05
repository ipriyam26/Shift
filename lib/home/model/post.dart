import 'package:equatable/equatable.dart';
import 'package:money_goes_brr/user/model/user.dart';

class Post extends Equatable {
  final String postId;
  final String userId;
  final String postUrl;
  final double postPrice;
   String? postCaption;
  final int postLikes;
  final String shareableLink;
  final DateTime? postDate;
  final PostType? postType;
  final String postThumbnail;
   String? postOwner;
   List<Transactions>? transactions;

   Post({
    required this.transactions,
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
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      userId: json['userId'],
      postUrl: json['postUrl'],
      postPrice: json['postPrice'].toDouble(),
      postCaption: json['postCaption'],
      postLikes: json['postLikes'],
      shareableLink: json['shareableLink'],
      postDate: json['postDate'] != null ? DateTime.parse(json['postDate']) : null,
      postType: json['postType'] != null ? _postTypeFromJson(json['postType']) : null,
      postThumbnail: json['postThumbnail'],
      postOwner: json['postOwner'],
      transactions: [],
    );
  }

// make to json function

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "postUrl": postUrl,
      "postPrice": postPrice,
      "postCaption": postCaption,
      "postLikes": postLikes,
      "shareableLink": shareableLink,
      "postDate": postDate!.microsecondsSinceEpoch,
      "postType": postType.toString(),
      "postThumbnail": postThumbnail,
      "postOwner": postOwner,
      "transactions": transactions!.map((e) => e.toJson()).toList(),
    };
  }

  static PostType? _postTypeFromJson(String postType) {
    switch (postType) {
      case 'Image':
        return PostType.image;
      case 'Video':
        return PostType.video;
      default:
        return null;
    }
  }


  static List<Post> items =  [

    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 100,
        postCaption: "Making memories one adventure at a time 📷 #TravelGoals",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "1",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "134134",
              transactionAmount: 200,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 142,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added)
        ]),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 200,
        postCaption: "Life is too short to not dance in the rain 💃 #MondayMotivation",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "2",
        userId: "1",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124124",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 345,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added)
        ]),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 50,
        postCaption: "Good food, good vibes, and good company 🍴 #FoodieLife",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "3",
        userId: "2",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "12421",
              transactionAmount: 145,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.cashedOut),
          Transactions(
              transactionId: "134134",
              transactionAmount: 565,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added)
        ]),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 150,
        postCaption: "Finding peace in nature 🌳 #FindYourZen",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "4",
        userId: "2",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124214",
              transactionAmount: 225,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 765,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added)
        ]),
    Post(
        postUrl: "https://i.imgur.com/nxhBPid.jpeg",
        postPrice: 80,
        postCaption: "Making the most out of each day 🌅 #TakeChances",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "5",
        userId: "3",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "12421412",
              transactionAmount: 543,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.bought),
          Transactions(
              transactionId: "134134",
              transactionAmount: 435,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 124,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added)
        ]),
    Post(
        postUrl: "https://i.imgur.com/p2ZQ6mG.mp4",
        postPrice: 75,
        postCaption: "Pursuing happiness one step at a time 🏃‍♀️ #NeverStopExploring",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "6",
        userId: "3",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/2gwaqQv.png",
        postPrice: 75,
        postCaption: "Embracing my inner child 🎡 #NeverGrowUp",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.image,
        postId: "7",
        userId: "4",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/UnN2xLZ.mp4",
        postPrice: 75,
        postCaption: "Making magic with every moment 💫 #LiveLifeLaughing",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "8",
        userId: "4",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/NrAGhL6.mp4",
        postPrice: 75,
        postCaption: "Creating a life I love 💕 #LiveLifeHappy",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "9",
        userId: "5",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/XTsY4Zb.mp4",
        postPrice: 75,
        postCaption: "Capturing memories, one photo at a time 📸 #KeepExploring",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "10",
        userId: "5",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/T7Bgiqe.mp4",
        postPrice: 75,
        postCaption: "Finding joy in the little things 🌼 #TakeTimeToSmellTheRoses",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "11",
        userId: "6",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
    Post(
        postUrl: "https://i.imgur.com/tbMbPYG.mp4",
        postPrice: 75,
        postCaption: "Life is too precious to not take risks 💪 #TakeChances",
        shareableLink: "shareableLink",
        postLikes: 100,
        postType: PostType.video,
        postId: "12",
        userId: "6",
        postOwner: "2",
        postThumbnail: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
        postDate: null,
        transactions: [
          Transactions(
              transactionId: "124wrq1",
              transactionAmount: 123,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.sold),
          Transactions(
              transactionId: "134134",
              transactionAmount: 542,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
          Transactions(
              transactionId: "134134",
              transactionAmount: 356,
              transactionDate: DateTime.now(),
              transactionType: TransactionType.added),
        ]),
  ];

  @override
  List<Object?> get props =>
      [postUrl, postPrice, postCaption, shareableLink, postLikes, postId, userId, postThumbnail, postOwner];
}

enum PostType {
  video,
  image,
}
