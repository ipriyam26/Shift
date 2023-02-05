type PostType = "video" | "image" | "audio";
type TransactionType = "added" | "bought" | "sold" | "cashedOut";

interface Balance {
  id:string,
  balance: number;
  transactions: Transactions[];
}

interface History {
  id:string;
  historyItems: Post[];
}

interface CurrentOwned {
  id:string;
  currentOwnedItems: Post[];
}

interface Saved {
  id: string;
  savedItems: Post[];
}

interface Profit {
  id: string;
  profit: number;
  transactions: PostTransaction[];
}

interface PostTransaction {
  id: string;
  post: Post;
  purchase: Transactions;
  sale: Transactions;
  isSold: boolean;
}

interface User {
  id: string;
  password: string;
  name: string;
  email: string;
  caption: string;
  imageUrl: string;
  profit: Profit;
  currentBalance: Balance;
  history: History;
  currentOwned: CurrentOwned;
  saved: Saved;
}

interface HomeModel {
  id: string;
  contentUrl: Post[];
  userName: string;
  userprofileUrl: string;
  userGenre: string;
  isVerified: boolean;
}

interface Post  {
  postId: string;
  userId: string;
  postUrl: string;
  postPrice: number;
  postCaption?: string;
  postLikes: number;
  shareableLink: string;
  postDate?: Date;
  postType: PostType;
  postThumbnail: string;
  postOwner?: string;
}

interface Transactions {
  id: string;
  postId: string;
  userId: string;
  transactionAmount: number;
  transactionDate: string;
  transactionType: TransactionType;
}

export { PostType,TransactionType,Transactions,Balance,History,CurrentOwned,Saved,Profit,PostTransaction,User,HomeModel,Post};