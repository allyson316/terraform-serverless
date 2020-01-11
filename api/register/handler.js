"use strict";

const AWS = require("aws-sdk");
AWS.config.update({
  region: process.env.AWS_REGION
});
const documentClient = new AWS.DynamoDB.DocumentClient();
const bcrypt = require("bcryptjs");
const uuid = require("uuid/v4");

module.exports.register = async event => {
  const body = JSON.parse(event.body);
  const params = {
    TableName: process.env.DYNAMODB_USERS,
    Item: {
      id: uuid(),
      name: body.name,
      email: body.email,
      password: bcrypt.hashSync(body.password, 10)
    }
  };
  return await new Promise((resolve, reject) => {
    documentClient.put(params, (error, data) => {
      if (error) {
        console.log(`ERROR=${error.stack}`);
        resolve({
          statusCode: 400,
          error: `error: ${error.stack}`
        });
      } else {
        resolve({ statusCode: 201, body: JSON.stringify(params.Item) });
      }
    });
  });
};
