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
export const createContent = (content) => {
    try {
        const id = uid();
        set(ref(db, 'content/' + id), {
            user_id: content.user_id,
            link: content.link,
            is_video: content.is_video,
            category: content.category,
            views: content.views,
            current_price: content.current_price,
            content_caption: content.content_caption
        });
        return id;
    }
    catch (err) {
        return err;
    }
};
export const getContent = (contentId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `content/${contentId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on content:${contentId}`;
    }
});
export const updateContent = (contentId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `content/${contentId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deleteContent = (contentId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `content/${contentId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
