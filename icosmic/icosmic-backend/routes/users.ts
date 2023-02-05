import * as express from "express";
import { deleteUser,updateUser,getUser,createUser } from "../db/functions/users.js";

const router = express.Router();

router.post("/users", (req, res) => {
  try {
    console.log(req.body.user);
    let user = JSON.parse(JSON.stringify(req.body.user));
    console.log(user, "user");
    let id = createUser(user);
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

router.get('/users/:userId', async (req, res) => {
  const id = req.params.userId;
  res.send(await getUser(id));
})

router.put('/users/:userId', async (req, res) => {
  const id = req.params.userId;
  res.send(await updateUser(id,req.body.user));
})

router.delete('/users/:userId', async (req, res) => {
  const id = req.params.userId;
  res.send(deleteUser(id));
})

export default router;
