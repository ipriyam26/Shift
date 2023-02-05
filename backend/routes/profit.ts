import * as express from "express";
import { deleteProfit,updateProfit,getProfit,createProfit } from "../db/functions/profit.js";

const router = express.Router();

router.post("/profit", (req, res) => {
  try {
    const profit = req.body.profit;
    console.log(profit, "profit");
    const id = createProfit(profit);
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

router.get('/profit/:profitId', async (req, res) => {
  const id = req.params.profitId;
  res.send(await getProfit(id));
})

router.put('/profit/:profitId', async (req, res) => {
  const id = req.params.profitId;
  res.send(await updateProfit(id,req.body.profit));
})

router.delete('/profit/:profitId', async (req, res) => {
  const id = req.params.profitId;
  res.send(deleteProfit(id));
})

export default router;
