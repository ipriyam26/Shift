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
export const createHomeModel = (homeModel) => {
    try {
        set(ref(db, 'homeModel/' + homeModel.id), {
            id: homeModel.id,
            contentUrl: homeModel.contentUrl,
            userName: homeModel.userName,
            userprofileUrl: homeModel.userprofileUrl,
            userGenre: homeModel.userGenre,
            isVerified: homeModel.isVerified
        });
        return homeModel.id;
    }
    catch (err) {
        return err;
    }
};
export const getHomeModel = (homeModelId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `homeModel/${homeModelId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on homeModel:${homeModelId}`;
    }
});
export const updateHomeModel = (homeModelId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `homeModel/${homeModelId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteHomeModel = (homeModelId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `homeModel/${homeModelId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
