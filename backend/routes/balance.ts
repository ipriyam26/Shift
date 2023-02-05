import * as express from "express";
import { deleteBalance,updateBalance,getBalance,createBalance } from "../db/functions/balance.js";

const router = express.Router();

router.post("/balance", (req, res) => {
  try {
    const balance = req.body.balance;
    console.log(balance, "balance");
    const id = createBalance(balance);
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

router.get('/balance/:balanceId', async (req, res) => {
  const id = req.params.balanceId;
  res.send(await getBalance(id));
})

router.put('/balance/:balanceId', async (req, res) => {
  const id = req.params.balanceId;
  res.send(await updateBalance(id,req.body.balance));
})

router.delete('/balance/:balanceId', async (req, res) => {
  const id = req.params.balanceId;
  res.send(deleteBalance(id));
})

export default router;
