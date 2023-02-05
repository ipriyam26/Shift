import { remove,update,get,child ,ref, set } from "firebase/database";
import { Saved } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createSaved = (saved: Saved) => {
    try {
        set(ref(db, 'saved/' + saved.id), {
            id: saved.id,
            savedItems: saved.savedItems
})
        return saved.id;
    } catch(err){
        return err;
    }
};

export const getSaved = async (savedId: string) => {
    const snapshot = await get(child(ref(db), `saved/${savedId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on saved:${savedId}`
        }
};

export const updateSaved = async (savedId: string, updatedData: any) => {
    const dbRef = ref(db, `saved/${savedId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteSaved = async (savedId: string) => {
    const dfRef = ref(db, `saved/${savedId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}