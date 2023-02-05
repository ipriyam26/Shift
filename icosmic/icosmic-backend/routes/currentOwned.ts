import * as express from "express";
import { deleteCurrentOwned,updateCurrentOwned,getCurrentOwned,createCurrentOwned } from "../db/functions/currentOwned.js";

const router = express.Router();

router.post("/currentOwned", (req, res) => {
  try {
    const currentOwned = req.body.currentOwned;
    console.log(currentOwned, "currentOwned");
    const id = createCurrentOwned(currentOwned);
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

router.get('/currentOwned/:currentOwnedId', async (req, res) => {
  const id = req.params.currentOwnedId;
  res.send(await getCurrentOwned(id));
})

router.put('/currentOwned/:currentOwnedId', async (req, res) => {
  const id = req.params.currentOwnedId;
  res.send(await updateCurrentOwned(id,req.body.currentOwned));
})

router.delete('/currentOwned/:currentOwnedId', async (req, res) => {
  const id = req.params.currentOwnedId;
  res.send(deleteCurrentOwned(id));
})

export default router;
