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
import { deleteSaved, updateSaved, getSaved, createSaved } from "../db/functions/saved.js";
const router = express.Router();
router.post("/saved", (req, res) => {
    try {
        const saved = req.body.saved;
        console.log(saved, "saved");
        const id = createSaved(saved);
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
router.get('/saved/:savedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.savedId;
    res.send(yield getSaved(id));
}));
router.put('/saved/:savedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.savedId;
    res.send(yield updateSaved(id, req.body.saved));
}));
router.delete('/saved/:savedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.savedId;
    res.send(deleteSaved(id));
}));
export default router;
