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
import { deletePostTransaction, updatePostTransaction, getPostTransaction, createPostTransaction } from "../db/functions/postTransaction.js";
const router = express.Router();
router.post("/postTransactions", (req, res) => {
    try {
        const postTransaction = req.body.postTransaction;
        console.log(postTransaction, "postTransaction");
        const id = createPostTransaction(postTransaction);
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
router.get('/postTransactions/:postTransactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postTransactionId;
    res.send(yield getPostTransaction(id));
}));
router.put('/postTransactions/:postTransactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postTransactionId;
    res.send(yield updatePostTransaction(id, req.body.postTransaction));
}));
router.delete('/postTransactions/:postTransactionId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postTransactionId;
    res.send(deletePostTransaction(id));
}));
export default router;
