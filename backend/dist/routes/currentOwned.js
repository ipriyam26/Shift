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
import { deleteCurrentOwned, updateCurrentOwned, getCurrentOwned, createCurrentOwned } from "../db/functions/currentOwned.js";
const router = express.Router();
router.post("/currentOwned", (req, res) => {
    try {
        const currentOwned = req.body.currentOwned;
        console.log(currentOwned, "currentOwned");
        const id = createCurrentOwned(currentOwned);
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
router.get('/currentOwned/:currentOwnedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.currentOwnedId;
    res.send(yield getCurrentOwned(id));
}));
router.put('/currentOwned/:currentOwnedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.currentOwnedId;
    res.send(yield updateCurrentOwned(id, req.body.currentOwned));
}));
router.delete('/currentOwned/:currentOwnedId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.currentOwnedId;
    res.send(deleteCurrentOwned(id));
}));
export default router;
