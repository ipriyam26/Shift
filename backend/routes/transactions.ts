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
} catch (error) {
if (error instanceof SyntaxError) {
res.send(`Invalid JSON: ${error.message}`);
} else {
throw error;
}
}
});

router.get('/transactions/:transactionId', async (req, res) => {
const id = req.params.transactionId;
res.send(await getTransaction(id));
})

router.put('/transactions/:transactionId', async (req, res) => {
const id = req.params.transactionId;
res.send(await updateTransaction(id,req.body.transaction));
})

router.delete('/transactions/:transactionId', async (req, res) => {
const id = req.params.transactionId;
res.send(deleteTransaction(id));
})

export default router;