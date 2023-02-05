import * as express from "express";
import { deleteHistory,updateHistory,getHistory,createHistory } from "../db/functions/history.js";

const router = express.Router();

router.post("/history", (req, res) => {
  try {
    const history = req.body.history;
    console.log(history, "history");
    const id = createHistory(history);
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

router.get('/history/:historyId', async (req, res) => {
  const id = req.params.historyId;
  res.send(await getHistory(id));
})

router.put('/history/:historyId', async (req, res) => {
  const id = req.params.historyId;
  res.send(await updateHistory(id,req.body.history));
})

router.delete('/history/:historyId', async (req, res) => {
  const id = req.params.historyId;
  res.send(deleteHistory(id));
})

export default router;
