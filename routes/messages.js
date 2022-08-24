const express = require("express");
const app = express.Router();
const quriesMessages = require("../mysql/quriesMessages");
const pConnection = require("../mysql/connection");

/*
add a message to backend
delete a message to backend
block a user based on message

pull all messages fpr certain user id except those on block list
 */

module.exports = app;
