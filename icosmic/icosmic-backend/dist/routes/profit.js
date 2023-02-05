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
import { deleteProfit, updateProfit, getProfit, createProfit } from "../db/functions/profit.js";
const router = express.Router();
router.post("/profit", (req, res) => {
    try {
        const profit = req.body.profit;
        console.log(profit, "profit");
        const id = createProfit(profit);
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
router.get('/profit/:profitId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.profitId;
    res.send(yield getProfit(id));
}));
router.put('/profit/:profitId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.profitId;
    res.send(yield updateProfit(id, req.body.profit));
}));
router.delete('/profit/:profitId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.profitId;
    res.send(deleteProfit(id));
}));
export default router;
