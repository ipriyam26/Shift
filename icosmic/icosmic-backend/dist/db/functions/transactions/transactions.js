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
import db from "../../firestore/config.js";
import { uid } from "uid";
export const createTransaction = (transaction) => {
    try {
        const id = uid();
        set(ref(db, 'transactions/' + id), {
            content_id: transaction.content_id,
            user_id: transaction.user_id,
            time_stamp: transaction.time_stamp,
            amount: transaction.amount
        });
        return id;
    }
    catch (err) {
        return err;
    }
};
export const getTransaction = (transactionId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `transactions/${transactionId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on transaction:${transactionId}`;
    }
});
export const updateTransaction = (transactionId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `transactions/${transactionId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteTransaction = (transactionId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `transactions/${transactionId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
