"use strict";

const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_SERVER,
  port: 2525,
  auth: {
    user: process.env.EMAIL_FROM,
    pass: process.env.EMAIL_FROM_PASSWORD
  }
});

module.exports.send = async event => {
  const emailPromisses = [];
  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message;
    emailPromisses.push(
      transporter.sendMail({
        from: `"Reservas 👻" <${process.env.EMAIL_FROM}>`,
        to: process.env.EMAIL_TO,
        subject: "Reserva Efetuada ✔",
        text: message,
        html: message
      })
    );
  }

  await Promise.all(emailPromisses);
  console.log("Emails enviados com sucesso!");
  return {
    message: "Go Serverless v1.0! Your function executed successfully!",
    event
  };
};
