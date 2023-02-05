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
import { uid } from "uid";
export const createPost = (post) => {
    const id = uid();
    try {
        set(ref(db, 'post/' + id), {
            postId: id,
            userId: post.userId,
            postUrl: post.postUrl,
            postPrice: post.postPrice,
            postCaption: post.postCaption,
            postLikes: post.postLikes,
            shareableLink: post.shareableLink,
            postDate: post.postDate,
            postType: post.postType,
            postThumbnail: post.postThumbnail,
            postOwner: post.postOwner
        });
        return id;
    }
    catch (err) {
        return err;
    }
};
export const getPost = (postId) => __awaiter(void 0, void 0, void 0, function* () {
    const snapshot = yield get(child(ref(db), `post/${postId}`));
    if (snapshot.exists()) {
        console.log(snapshot.val(), "val");
        return snapshot.val();
    }
    else {
        return `No data on post:${postId}`;
    }
});
export const updatePost = (postId, updatedData) => __awaiter(void 0, void 0, void 0, function* () {
    const dbRef = ref(db, `post/${postId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    });
});
export const deletePost = (postId) => __awaiter(void 0, void 0, void 0, function* () {
    const dfRef = ref(db, `post/${postId}`);
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err); });
});
