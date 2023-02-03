import 'package:money_goes_brr/home/model/post.dart';

class User {
  final String name;
  final String email;
  final String caption;
  final String imageUrl;
  final Profit profit;
  final Balance currentBalance;
  final History history;
  final CurrentOwned currentOwned;
  final Saved saved;
  final String id;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.caption,
    required this.imageUrl,
    required this.profit,
    required this.currentBalance,
    required this.history,
    required this.currentOwned,
    required this.saved,
  });
}

class Saved {
  final List<Post> savedItems;

  const Saved({
    required this.savedItems,
  });
}

class CurrentOwned {
  final List<Post> currentOwnedItems;

  const CurrentOwned({
    required this.currentOwnedItems,
  });
}

class History {
  final List<Post> historyItems;

  const History({
    required this.historyItems,
  });
}

class Balance {
  final double balance;
  final List<Transactions> transactions;

  const Balance({
    required this.balance,
    required this.transactions,
  });
}

class PostTransaction {
  final Post post;
  final Transactions purchase;
  final Transactions sale;
  final bool isSold;

  const PostTransaction({
    required this.post,
    required this.purchase,
    required this.sale,
    required this.isSold,
  });
}

class Transactions {
  final String transactionId;

  final double transactionAmount;
  final DateTime transactionDate;
  final TransactionType transactionType;

  const Transactions({
    required this.transactionId,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionType,
  });
}

enum TransactionType { added, bought, sold, cashedOut }

class Profit {
  final double profit;
  final List<PostTransaction> transactions;
// transactions is a list of transactions that are related to profit, like buying and selling items and not cashing out or adding money

  const Profit({
    required this.profit,
    required this.transactions,
  });
}
