import express from 'express';
import errorHandler from "errorhandler";
import methodOverride from "method-override";
import logger from "morgan";
import cors from "cors";
import dotenv from "dotenv";
import users from "./routes/users.js";
import transactions from "./routes/transactions.js";
import saved from "./routes/saved.js";
import balance from "./routes/balance.js";
import currentOwned from "./routes/currentOwned.js";
import history from "./routes/history.js";
import homeModel from "./routes/homeModel.js";
import post from "./routes/post.js";
import postTransaction from "./routes/postTransaction.js";
import profit from "./routes/profit.js";
dotenv.config();
const app = express();
const port = process.env.PORT || 3000;
var router = express.Router();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(logger("dev"));
app.use(methodOverride("_method"));
app.use(errorHandler());
const corsOptions = {
    origin: "*",
    optionsSuccessStatus: 200
};
app.use(cors(corsOptions));
app.get('/', (req, res) => {
    res.send('It works!');
});
app.use(users);
app.use(transactions);
app.use(saved);
app.use(balance);
app.use(currentOwned);
app.use(profit);
app.use(postTransaction);
app.use(post);
app.use(homeModel);
app.use(history);
app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
