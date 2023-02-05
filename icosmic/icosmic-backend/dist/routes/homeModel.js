var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import * as express from "express";
import { deleteHomeModel, updateHomeModel, getHomeModel, createHomeModel } from "../db/functions/homeModel.js";
const router = express.Router();
router.post("/homeModel", (req, res) => {
    try {
        const homeModel = req.body.homeModel;
        console.log(homeModel, "homeModel");
        const id = createHomeModel(homeModel);
        console.log(id);
        res.send(id);
    }
    catch (error) {
        if (error instanceof SyntaxError) {
            res.send(`Invalid JSON: ${error.message} `);
        }
        else {
            throw error;
        }
    }
});
router.get('/homeModel/:homeModelId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.homeModelId;
    res.send(yield getHomeModel(id));
}));
router.put('/homeModel/:homeModelId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.homeModelId;
    res.send(yield updateHomeModel(id, req.body.homeModel));
}));
router.delete('/homeModel/:homeModelId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.homeModelId;
    res.send(deleteHomeModel(id));
}));
export default router;
