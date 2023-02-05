var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import * as express from "express";
import { deletePost, updatePost, getPost, createPost } from "../db/functions/post.js";
const router = express.Router();
router.post("/posts", (req, res) => {
    try {
        const post = req.body.post;
        console.log(post, "post");
        const id = createPost(post);
        console.log(id);
        res.send(id);
    }
    catch (error) {
        if (error instanceof SyntaxError) {
            res.send(`Invalid JSON: ${error.message} `);
        }
        else {
            throw error;
        }
    }
});
router.get('/posts/:postId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postId;
    res.send(yield getPost(id));
}));
router.put('/posts/:postId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postId;
    res.send(yield updatePost(id, req.body.post));
}));
router.delete('/posts/:postId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.postId;
    res.send(deletePost(id));
}));
export default router;
