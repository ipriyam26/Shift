var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { remove, update, get, child, ref, set } from "firebase/database";
import db from "../firestore/config.js";
export const createPostTransaction = (postTransaction) => {
    try {
        set(ref(db, 'postTransaction/' + postTransaction.id), {
            id: postTransaction.id,
            post: postTransaction.post,
            purchase: postTransaction.purchase,
            sale: postTransaction.sale,
            isSold: postTransaction.isSold
        });
        return postTransaction.id;
    }
    catch (err) {
        return err;
    }
};
export const getPostTransaction = (postTransactionId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `postTransaction/${postTransactionId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on postTransaction:${postTransactionId}`;
    }
});
export const updatePostTransaction = (postTransactionId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `postTransaction/${postTransactionId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deletePostTransaction = (postTransactionId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `postTransaction/${postTransactionId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
