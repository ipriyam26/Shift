import { remove,update,get,child ,ref, set } from "firebase/database";
import { HomeModel } from '../Entities/entities.js';
import db from "../firestore/config.js";
import { uid } from "uid";

export const createHomeModel = (homeModel: HomeModel) => {
    try {
        set(ref(db, 'homeModel/' + homeModel.id), {
            id: homeModel.id,
            contentUrl: homeModel.contentUrl,
            userName: homeModel.userName,
            userprofileUrl: homeModel.userprofileUrl,
            userGenre: homeModel.userGenre,
            isVerified: homeModel.isVerified
})
        return homeModel.id;
    } catch(err){
        return err;
    }
};

export const getHomeModel = async (homeModelId: string) => {
    const snapshot = await get(child(ref(db), `homeModel/${homeModelId}`))
    if (snapshot.exists()){
            console.log(snapshot.val(), "val");
            return snapshot.val();
        } else{
            return `No data on homeModel:${homeModelId}`
        }
};

export const updateHomeModel = async (homeModelId: string, updatedData: any) => {
    const dbRef = ref(db, `homeModel/${homeModelId}`);
    update(dbRef, updatedData).then(() => {
        console.log("Success");
    }).catch((e) => {
        console.log(e);
    })
}

export const deleteHomeModel = async (homeModelId: string) => {
    const dfRef = ref(db, `homeModel/${homeModelId}`)
    remove(dfRef).then(() => {
        console.log('deleted');
    }).catch(err => { console.log(err) });
}