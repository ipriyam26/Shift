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
export const createSaved = (saved) => {
    try {
        set(ref(db, 'saved/' + saved.id), {
            id: saved.id,
            savedItems: saved.savedItems
        });
        return saved.id;
    }
    catch (err) {
        return err;
    }
};
export const getSaved = (savedId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `saved/${savedId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on saved:${savedId}`;
    }
});
export const updateSaved = (savedId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `saved/${savedId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteSaved = (savedId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `saved/${savedId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
