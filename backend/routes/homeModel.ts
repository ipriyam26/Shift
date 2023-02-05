import * as express from "express";
import { deleteHomeModel,updateHomeModel,getHomeModel,createHomeModel } from "../db/functions/homeModel.js";

const router = express.Router();

router.post("/homeModel", (req, res) => {
  try {
    const homeModel = req.body.homeModel;
    console.log(homeModel, "homeModel");
    const id = createHomeModel(homeModel);
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

router.get('/homeModel/:homeModelId', async (req, res) => {
  const id = req.params.homeModelId;
  res.send(await getHomeModel(id));
})

router.put('/homeModel/:homeModelId', async (req, res) => {
  const id = req.params.homeModelId;
  res.send(await updateHomeModel(id,req.body.homeModel));
})

router.delete('/homeModel/:homeModelId', async (req, res) => {
  const id = req.params.homeModelId;
  res.send(deleteHomeModel(id));
})

export default router;
