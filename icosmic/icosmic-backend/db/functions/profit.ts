import { remove,update,get,child ,ref, set } from "firebase/database";
import { Profit } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createProfit = (profit: Profit) => {
    try {
        set(ref(db, 'profit/' + profit.id), {
            id: profit.id,
            profit: profit.profit,
            transactions: profit.transactions
})
        return profit.id;
    } catch(err){
        return err;
    }
};

export const getProfit = async (profitId: string) => {
    const snapshot = await get(child(ref(db), `profit/${profitId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on profit:${profitId}`
        }
};

export const updateProfit = async (profitId: string, updatedData: any) => {
    const dbRef = ref(db, `profit/${profitId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteProfit = async (profitId: string) => {
    const dfRef = ref(db, `profit/${profitId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}