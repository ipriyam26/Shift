var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { createContent, getContent, updateContent, deleteContent } from "../db/functions/contents/contents.js";
import express from "express";
const router = express.Router();
router.post("/content", (req, res) => {
    try {
        const content = req.body.content;
        console.log(content, "content");
        const id = createContent(content);
        console.log(id);
        res.send(id);
    }
    catch (error) {
        if (error instanceof SyntaxError) {
            res.send(`Invalid JSON: ${error.message}`);
        }
        else {
            throw error;
        }
    }
});
router.get('/content/:contentId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.contentId;
    res.send(yield getContent(id));
}));
router.put('/content/:contentId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.contentId;
    res.send(yield updateContent(id, req.body.content));
}));
router.delete('/content/:contentId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.contentId;
    res.send(deleteContent(id));
}));
export default router;
