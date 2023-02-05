import { remove,update,get,child ,ref, set } from "firebase/database";
import { Transactions } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createTransaction = (transaction: Transactions) => {
                try {
                    const id = uid();
                    set(ref(db, 'transactions/' + id), {
                        id: id,
                        postId: transaction.postId,
                        userId: transaction.userId,
                        transactionAmount: transaction.transactionAmount,
                        transactionDate: transaction.transactionDate,
                        transactionType: transaction.transactionType
})
                return id;
                } catch(err){
return err;
}
};

export const getTransaction = async (transactionId: string) => {
const snapshot = await get(child(ref(db), `transactions/${transactionId}`))
if (snapshot.exists()){
console.log(snapshot.val(), "val");
return snapshot.val();
} else{
return `No data on transaction:${transactionId}`
}
};

export const updateTransaction = async (transactionId: string, updatedData: any) => {
const dbRef = ref(db, `transactions/${transactionId}`);
update(dbRef, updatedData).then(() => {
console.log("Success");
}).catch((e) => {
console.log(e);
})
}

export const deleteTransaction = async (transactionId: string) => {
const dfRef = ref(db, `transactions/${transactionId}`)
remove(dfRef).then(() => {
console.log('deleted');
}).catch(err => { console.log(err) });
}