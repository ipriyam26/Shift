import { remove,update,get,child ,ref, set } from "firebase/database";
import { Post } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createPost = (post: Post) => {
    const id = uid()
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
})
        return id;
    } catch(err){
        return err;
    }
};

export const getPost = async (postId: string) => {
    const snapshot = await get(child(ref(db), `post/${postId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on post:${postId}`
        }
};

export const updatePost = async (postId: string, updatedData: any) => {
    const dbRef = ref(db, `post/${postId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deletePost = async (postId: string) => {
    const dfRef = ref(db, `post/${postId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}