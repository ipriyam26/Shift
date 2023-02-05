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
import { deleteTransaction, updateTransaction, getTransaction, createTransaction } from "../db/functions/transactions.js";
const router = express.Router();
router.post("/transactions", (req, res) => {
    try {
        const transaction = req.body.transaction;
        console.log(transaction, "transaction");
        const id = createTransaction(transaction);
        console.log(id);
        res.send(id);
    }
    catch (error) {
        if (error instanceof SyntaxError) {
            res.send(`Invalid JSON: ${error.message}`);
        }
        else {
            throw error;
        }
    }
});
router.get('/transactions/:transactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.transactionId;
    res.send(yield getTransaction(id));
}));
router.put('/transactions/:transactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.transactionId;
    res.send(yield updateTransaction(id, req.body.transaction));
}));
router.delete('/transactions/:transactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.transactionId;
    res.send(deleteTransaction(id));
}));
export default router;
