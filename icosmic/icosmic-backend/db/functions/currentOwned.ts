import { remove,update,get,child ,ref, set } from "firebase/database";
import { CurrentOwned } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createCurrentOwned = (currentOwned: CurrentOwned) => {
    try {
        set(ref(db, 'currentOwned/' + currentOwned.id), {
            id: currentOwned.id,
            currentOwnedItems: currentOwned.currentOwnedItems
})
        return currentOwned.id;
    } catch(err){
        return err;
    }
};

export const getCurrentOwned = async (currentOwnedId: string) => {
    const snapshot = await get(child(ref(db), `currentOwned/${currentOwnedId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on currentOwned:${currentOwnedId}`
        }
};

export const updateCurrentOwned = async (currentOwnedId: string, updatedData: any) => {
    const dbRef = ref(db, `currentOwned/${currentOwnedId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteCurrentOwned = async (currentOwnedId: string) => {
    const dfRef = ref(db, `currentOwned/${currentOwnedId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}