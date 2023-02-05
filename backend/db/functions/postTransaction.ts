import { remove,update,get,child ,ref, set } from "firebase/database";
import { PostTransaction } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createPostTransaction = (postTransaction: PostTransaction) => {
    try {
        set(ref(db, 'postTransaction/' + postTransaction.id), {
            id: postTransaction.id,
            post: postTransaction.post,
            purchase: postTransaction.purchase,
            sale: postTransaction.sale,
            isSold: postTransaction.isSold
})
        return postTransaction.id;
    } catch(err){
        return err;
    }
};

export const getPostTransaction = async (postTransactionId: string) => {
    const snapshot = await get(child(ref(db), `postTransaction/${postTransactionId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on postTransaction:${postTransactionId}`
        }
};

export const updatePostTransaction = async (postTransactionId: string, updatedData: any) => {
    const dbRef = ref(db, `postTransaction/${postTransactionId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deletePostTransaction = async (postTransactionId: string) => {
    const dfRef = ref(db, `postTransaction/${postTransactionId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}