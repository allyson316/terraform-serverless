const AWS = require("aws-sdk");
AWS.config.update({
  region: process.env.AWS_REGION
});
const documentClient = new AWS.DynamoDB.DocumentClient();

module.exports.list = async event => {
  const isAdmin = event.requestContext.authorizer.role;

  if (isAdmin === "ADMIN") {
    const params = {
      TableName: process.env.DYNAMODB_BOOKINGS
    };

    const data = await documentClient.scan(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(data.Items)
    };
  }
  return {
    statusCode: 403,
    body: JSON.stringify({ error: "Usuário não autorizado!" })
  };
};
