import { remove,update,get,child ,ref, set } from "firebase/database";
import { Balance } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createBalance = (balance: Balance) => {
    try {
        set(ref(db, 'balance/' + balance.id), {
            id: balance.id,
            balance: balance.balance,
            transactions: balance.transactions
})
        return balance.id;
        
    } catch(err){
        return err;
    }
};

export const getBalance = async (userId: string) => {
    const snapshot = await get(child(ref(db), `balance/${userId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on user:${userId}`
        }
};

export const updateBalance = async (userId: string, updatedData: any) => {
    const dbRef = ref(db, `balance/${userId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteBalance = async (userId: string) => {
    const dfRef = ref(db, `balance/${userId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}