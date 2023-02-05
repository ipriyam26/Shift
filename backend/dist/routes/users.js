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
import { deleteUser, updateUser, getUser, createUser } from "../db/functions/users.js";
const router = express.Router();
router.post("/users", (req, res) => {
    try {
        console.log(req.body.user);
        let user = JSON.parse(JSON.stringify(req.body.user));
        console.log(user, "user");
        let id = createUser(user);
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
router.get('/users/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.userId;
    res.send(yield getUser(id));
}));
router.put('/users/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.userId;
    res.send(yield updateUser(id, req.body.user));
}));
router.delete('/users/:userId', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const id = req.params.userId;
    res.send(deleteUser(id));
}));
export default router;
