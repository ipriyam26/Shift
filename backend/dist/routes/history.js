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
import { deleteHistory, updateHistory, getHistory, createHistory } from "../db/functions/history.js";
const router = express.Router();
router.post("/history", (req, res) => {
    try {
        const history = req.body.history;
        console.log(history, "history");
        const id = createHistory(history);
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
router.get('/history/:historyId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.historyId;
    res.send(yield getHistory(id));
}));
router.put('/history/:historyId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.historyId;
    res.send(yield updateHistory(id, req.body.history));
}));
router.delete('/history/:historyId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.historyId;
    res.send(deleteHistory(id));
}));
export default router;
