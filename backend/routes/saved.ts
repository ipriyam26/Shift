import * as express from "express";
import { deleteSaved,updateSaved,getSaved,createSaved } from "../db/functions/saved.js";

const router = express.Router();

router.post("/saved", (req, res) => {
  try {
    const saved = req.body.saved;
    console.log(saved, "saved");
    const id = createSaved(saved);
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

router.get('/saved/:savedId', async (req, res) => {
  const id = req.params.savedId;
  res.send(await getSaved(id));
})

router.put('/saved/:savedId', async (req, res) => {
  const id = req.params.savedId;
  res.send(await updateSaved(id,req.body.saved));
})

router.delete('/saved/:savedId', async (req, res) => {
  const id = req.params.savedId;
  res.send(deleteSaved(id));
})

export default router;