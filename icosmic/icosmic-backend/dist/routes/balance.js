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
import { deleteBalance, updateBalance, getBalance, createBalance } from "../db/functions/balance.js";
const router = express.Router();
router.post("/balance", (req, res) => {
    try {
        const balance = req.body.balance;
        console.log(balance, "balance");
        const id = createBalance(balance);
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
router.get('/balance/:balanceId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.balanceId;
    res.send(yield getBalance(id));
}));
router.put('/balance/:balanceId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.balanceId;
    res.send(yield updateBalance(id, req.body.balance));
}));
router.delete('/balance/:balanceId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.balanceId;
    res.send(deleteBalance(id));
}));
export default router;
