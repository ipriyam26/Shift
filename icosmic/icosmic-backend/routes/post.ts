import * as express from "express";
import { deletePost,updatePost,getPost,createPost } from "../db/functions/post.js";

const router = express.Router();

router.post("/posts", (req, res) => {
  try {
    const post = req.body.post;
    console.log(post, "post");
    const id = createPost(post);
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

router.get('/posts/:postId', async (req, res) => {
  const id = req.params.postId;
  res.send(await getPost(id));
})

router.put('/posts/:postId', async (req, res) => {
  const id = req.params.postId;
  res.send(await updatePost(id,req.body.post));
})

router.delete('/posts/:postId', async (req, res) => {
  const id = req.params.postId;
  res.send(deletePost(id));
})

export default router;
