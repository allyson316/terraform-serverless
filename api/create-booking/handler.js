const AWS = require("aws-sdk");
AWS.config.update({
  region: process.env.AWS_REGION
});
const documentClient = new AWS.DynamoDB.DocumentClient();
const uuid = require("uuid/v4");

module.exports.create = async event => {
  const body = JSON.parse(event.body);
  const params = {
    TableName: process.env.DYNAMODB_BOOKINGS,
    Item: {
      id: uuid(),
      date: body.date,
      user: event.requestContext.authorizer
    }
  };

  await documentClient.put(params).promise();
  return {
    statusCode: 201,
    body: JSON.stringify(params.Item)
  };
};
