const express = require("express");
const app = express.Router();
const quriesUsers = require("../mysql/quriesUsers");
const pConnection = require("../mysql/connection");
const fs = require("fs");

//because we used await here, we need to add async
app.post("/", async (req, res) => {
  //   console.log(quriesUsers.addNewUsers(req.body.email));

  try {
    const result = await pConnection(quriesUsers.addNewUsers(req.body.email));
    if (result.affectedRows === 1) {
      res.send({ status: 1 });
    }
  } catch (error) {
    res.send({ status: 0, error: "Database refused to insert a new user" });
  }
  /*
    multiple quries add a whole user eg some sort of religion linking table,user table,details table not just email 
    able to login logout
    ability to store a selfie
    */
});
app.post("/selfie", (req, res) => {
  let base64Data = req.body.selfie.replace(/^data:image\/jpeg;base64,/, "");
  base64Data += base64Data.replace("+", " ");
  binaryData = Buffer.from(base64Data, "base64").toString("binary");

  fs.writeFile(
    `./userimages/${req.body.user_id} .jpg`,
    binaryData,
    "binary",
    function (err) {
      console.log(err); // writes out file without error, but it's not a valid image
    }
  );
  //    fs.writeFile(
  //     `./userimages/${req.body.user_id} .jpg`,
  //     req.body.selfie,
  //     (error) => {
  //       console.log(error);
  //     }
  //   );
});
module.exports = app;
