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
export const createBalance = (balance) => {
    try {
        set(ref(db, 'balance/' + balance.id), {
            id: balance.id,
            balance: balance.balance,
            transactions: balance.transactions
        });
        return balance.id;
    }
    catch (err) {
        return err;
    }
};
export const getBalance = (userId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `balance/${userId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on user:${userId}`;
    }
});
export const updateBalance = (userId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `balance/${userId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteBalance = (userId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `balance/${userId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
