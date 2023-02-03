import 'package:get/get.dart';
import 'package:money_goes_brr/home/model/post.dart';

import '../model/user.dart';

class UserController extends GetxController {
  final user = const User(
      id: "",
      name: "",
      email: "",
      caption: "",
      imageUrl: "",
      profit: Profit(profit: 0, transactions: []),
      currentBalance: Balance(balance: 0.0, transactions: []),
      history: History(historyItems: []),
      currentOwned: CurrentOwned(currentOwnedItems: []),
      saved: Saved(savedItems: [])).obs;

  @override
  void onInit() {
    super.onInit();

    user.value = const User(
        id: "132fwefsdf24f",
        name: "John Doe",
        email: "john.doe@gmail.com",
        caption: "I am a software developer",
        imageUrl: "https://picsum.photos/300",
        profit: Profit(profit: 0, transactions: []),
        currentBalance: Balance(balance: 0.0, transactions: []),
        history: History(historyItems: []),
        currentOwned: CurrentOwned(currentOwnedItems: []),
        saved: Saved(savedItems: []));
    update();
  }

  void getMoreSaved(int count) {
    user.update((val) {
      for (var i = 0; i < count; i++) {
        val!.saved.savedItems.add(const Post(
            postUrl: "https://picsum.photos/300",
            postPrice: 0.0,
            postCaption: "I am a software developer",
            postLikes: 0,
            shareableLink: "https://picsum.photos/200",
            postType: PostType.image));
      }
    });
  }

  void getMoreHistory(int count) {
    user.update((val) {
      for (var i = 0; i < count; i++) {
        val!.history.historyItems.add(const Post(
            postUrl: "https://picsum.photos/200",
            postPrice: 0.0,
            postCaption: "I am a software developer",
            postLikes: 0,
            shareableLink: "https://picsum.photos/200",
            postType: PostType.image));
      }
    });
  }

  void getMoreCurrentOwned(int count) {
    user.update((val) {
      for (var i = 0; i < count; i++) {
        val!.currentOwned.currentOwnedItems.add(const Post(
            postUrl: "https://picsum.photos/200",
            postPrice: 0.0,
            postCaption: "I am a software developer",
            postLikes: 0,
            shareableLink: "https://picsum.photos/200",
            postType: PostType.image));
      }
    });
  }

// void getMoreProfit(int count) {
//     user.update((val) {
//       for (var i = 0; i < count; i++) {
//         val!.profit.transactions.add(const Transactions(
//             amount: 0.0,
//             date: DateTime.now(),
//             description: "I am a software developer",
//             type: TransactionType.deposit));
//       }
//     });
//   }

//   void getMoreBalance(int count) {
//     user.update((val) {
//       for (var i = 0; i < count; i++) {
//         val!.currentBalance.transactions.add(const Transactions(
//             amount: 0.0,
//             date: DateTime.now(),
//             description: "I am a software developer",
//             type: TransactionType.deposit));
//       }
//     });
//   }

}
