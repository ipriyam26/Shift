import { remove,update,get,child ,ref, set } from "firebase/database";
import { History } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createHistory = (history: History) => {
    try {
        set(ref(db, 'history/' + history.id), {
            historyItems: history.historyItems
})
        return history.id;
    } catch(err){
        return err;
    }
};

export const getHistory = async (userId: string) => {
    const snapshot = await get(child(ref(db), `history/${userId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on user:${userId}`
        }
};

export const updateHistory = async (userId: string, updatedData: any) => {
    const dbRef = ref(db, `history/${userId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteHistory = async (userId: string) => {
    const dfRef = ref(db, `history/${userId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}