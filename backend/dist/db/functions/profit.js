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
export const createProfit = (profit) => {
    try {
        set(ref(db, 'profit/' + profit.id), {
            id: profit.id,
            profit: profit.profit,
            transactions: profit.transactions
        });
        return profit.id;
    }
    catch (err) {
        return err;
    }
};
export const getProfit = (profitId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `profit/${profitId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on profit:${profitId}`;
    }
});
export const updateProfit = (profitId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `profit/${profitId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteProfit = (profitId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `profit/${profitId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
