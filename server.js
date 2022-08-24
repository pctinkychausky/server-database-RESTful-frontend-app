//standard boilerplate
const express = require("express");
const app = express();

require("dotenv").config();

const cors = require("cors");
app.use(express.json());

//routes
app.get("/", () => {
  console.log("The server recevied a request");
});

app.use("/users", require("./routes/users"));
app.use("/messages", require("./routes/messages"));
app.use("/matching", require("./routes/matching"));

//server on
const port = process.env.PORT || 6001;
app.listen(port, () => {
  console.log(`Server is listening on http://localhost:${port}`);
});
