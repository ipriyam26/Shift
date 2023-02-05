import * as express from "express";
import { deletePostTransaction,updatePostTransaction,getPostTransaction,createPostTransaction } from "../db/functions/postTransaction.js";

const router = express.Router();

router.post("/postTransactions", (req, res) => {
  try {
    const postTransaction = req.body.postTransaction;
    console.log(postTransaction, "postTransaction");
    const id = createPostTransaction(postTransaction);
    console.log(id);
    res.send(id);
  } catch (error) {
    if (error instanceof SyntaxError) {
      res.send(`Invalid JSON: ${error.message} `);
    } else {
      throw error;
    }
  }
});

router.get('/postTransactions/:postTransactionId', async (req, res) => {
  const id = req.params.postTransactionId;
  res.send(await getPostTransaction(id));
})

router.put('/postTransactions/:postTransactionId', async (req, res) => {
  const id = req.params.postTransactionId;
  res.send(await updatePostTransaction(id,req.body.postTransaction));
})

router.delete('/postTransactions/:postTransactionId', async (req, res) => {
  const id = req.params.postTransactionId;
  res.send(deletePostTransaction(id));
})

export default router;
