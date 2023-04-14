const dotenv = require("dotenv");
// const mysql = require("mysql");
const express = require("express");
const session = require("express-session");
const path = require("path");
dotenv.config();

// function handleDisconnect() {
//   var con = mysql.createConnection({
//     host: process.env.DB_HOST,
//     user: process.env.DB_USER,
//     password: process.env.DB_PASSWORD,
//     port: process.env.DB_PORT,
//   });

//   con.connect(function (err) {
//     if (err) {
//       // console.log("Error connection to db");
//       setTimeout(handleDisconnect, 2000);
//     } else {
//       // console.log("Connection established");
//     }
//   });

//   con.on("error", function (err) {
//     console.log("db error", err);
//     if (err.code === "PROTOCOL_CONNECTION_LOST") {
//       handleDisconnect();
//     } else {
//       throw err;
//     }
//   });
// }

// handleDisconnect();

const PORT = process.env.PORT || 5050;
const router = require("./app/router");
const cors = require("cors");
const bodyParser = require("body-parser");

const userMiddleware = require("./app/middlewares/user");

const app = express();

const corsOptions = {
  // origin: true,
  // origin: "http://localhost:3000",
  origin: "https://obeach.jtdev.fr",
  // origin: process.env.DB_URL,
  optionsSuccesStatus: 200,
  credentials: true,
};
app.use(cors(corsOptions));

app.options("*", cors());

app.use("/public", express.static("public"));
app.use(express.static(path.resolve("public")));

app.use(
  session({
    saveUninitialized: false,
    resave: true,
    secret: "clé des sessions de oquizz, parce que je le vaux bien",
    // cookie: {},
  })
);

app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(userMiddleware);

app.use(router);

app.listen(PORT, () => {
  console.log(`Listening on ${PORT} ...`);
});
