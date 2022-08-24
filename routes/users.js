const express = require("express");
const app = express.Router();
const quriesUsers = require("../mysql/quriesUsers");
const pConnection = require("../mysql/connection");

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
});

module.exports = app;
