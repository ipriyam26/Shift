"use strict";
// import * as express from "express";
// import jwt from 'jsonwebtoken';
// import { query,where } from "firebase/firestore";
// import db from "../db/firestore/config.js";
// import { get,child ,ref,} from "firebase/database";
// const router = express.Router();
// router.use((req, res, next) => {
//   if (req.path == '/login' || req.path == '/signup') {
//     next();
//   } else { //login path
//     console.log('entered')
//     const token = req.headers['token'] as string;
//     console.log(token);
//     if (!token) {
//       console.log('no token');
//       return res.status(401).json({ message: 'No token provided' });
//     }
//     try {
//       console.log('here is some error');
//       const decoded = JSON.stringify(jwt.verify(token, !!process.env.JWT_SECRET ? process.env.JWT_SECRET : ""));
//       console.log(decoded,"decoded");
//       req.user = decoded;
//       next();
//     } catch (error) {
//       console.log("reaching error zone");
//       return res.status(401).json({ message: error });
//     }
//   }
// });
// router.post('/login',async (req: Request,res:Response) => {
//   var email = "";
//   var password = "";
//     if (req.body) {
//         email = req.body.email;
//         password = req.body.password;
//     }
//     console.log(req.body);
//     const usersRef = ref(db, 'users');
//   const user = query(usersRef);
//   console.log(password);
//   console.log(user?.password);
//   console.log(password);
//   if (user?.password === password) {
//     console.log('entered');
//     console.log("email", user?.email);
//     console.log("userId", user?.user_id);
//     console.log(process.env.JWT_SECRET);
//     var token = jwt.sign(JSON.stringify({ user_id: user?.user_id, username: user?.email }), !!process.env.JWT_SECRET ? process.env.JWT_SECRET : "", { algorithm: "HS256" }
//     );
//     res.status(200).send({ auth: true, token: !!token ? token : "" });
//   }else{
//     res.send("wrong password");
//   }
// })
// export default router;
