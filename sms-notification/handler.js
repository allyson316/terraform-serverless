"use strict";

const util = require("util");

const messagebird = require("messagebird")(process.env.MESSAGE_BIRD_API_KEY);
util.promisify(messagebird.messages.create);

module.exports.send = async event => {
  const smsPromisses = [];
  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message;
    const params = {
      originator: process.env.SMS_PHONE_FROM,
      recipients: [process.env.SMS_PHONE_TO],
      body: message
    };
    smsPromisses.push(messagebird.messages.create(params));
  }

  await Promise.all(smsPromisses);
  console.log("SMSs enviados com sucesso!");
  return {
    message: "Go Serverless v1.0! Your function executed successfully!",
    event
  };
};
