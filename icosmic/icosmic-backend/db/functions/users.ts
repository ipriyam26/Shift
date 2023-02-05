import { remove,update,get,child ,ref, set } from "firebase/database";
import { User } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createUser = (user: User) => {
    try {
        var id = uid();
        set(ref(db, 'users/' + id), {
            id: id,
            password: user.password,
            name: user.name,
            email: user.email,
            caption: user.caption,
            imageUrl: user.imageUrl,
            profit: user.profit,
            currentBalance: user.currentBalance,
            history: user.history,
            currentOwned: user.currentOwned,
            saved: user.saved
})
        return id;
    } catch(err){
        return err;
    }
};

export const getUser = async (userId: string) => {
    const snapshot = await get(child(ref(db), `users/${userId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on user:${userId}`
        }
};

export const updateUser = async (userId: string, updatedData: any) => {
    const dbRef = ref(db, `users/${userId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteUser = async (userId: string) => {
    const dfRef = ref(db, `users/${userId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}