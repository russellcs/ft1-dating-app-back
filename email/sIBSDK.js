//connect to sib
const SibApiV3Sdk = require("sib-api-v3-sdk");
let defaultClient = SibApiV3Sdk.ApiClient.instance;
let apiKey = defaultClient.authentications["api-key"];
apiKey.apiKey = process.env.SIB_API_KEY;

function sendEmail(toAddress, subject, content) {
  let apiInstance = new SibApiV3Sdk.TransactionalEmailsApi();
  let sendSmtpEmail = new SibApiV3Sdk.SendSmtpEmail();
  sendSmtpEmail.subject = subject;
  sendSmtpEmail.htmlContent = `<html><body>${content}</body></html>`;
  sendSmtpEmail.sender = { name: "Find Sparks", email: "hi@findsparks.uk" };
  sendSmtpEmail.to = [{ email: toAddress, name: toAddress }];

  apiInstance.sendTransacEmail(sendSmtpEmail).then(
    function (data) {
      console.log(
        "API called successfully. Returned data: " + JSON.stringify(data)
      );
    },
    function (error) {
      console.error(error);
    }
  );
}

module.exports = sendEmail;

// sendSmtpEmail.subject = "Welcome to Find Sparks!";
// sendSmtpEmail.htmlContent = "<html><body><h1>Hi</h1></body></html>";
// sendSmtpEmail.sender = { name: "Find Sparks", email: "hi@findsparks.uk" };
// sendSmtpEmail.to = [{ email: "r@tinsleymail.co.uk", name: "Russell" }];
// sendSmtpEmail.cc = [{ email: "example2@example2.com", name: "Janice Doe" }];
// sendSmtpEmail.bcc = [{ email: "John Doe", name: "example@example.com" }];
// sendSmtpEmail.replyTo = { email: "replyto@domain.com", name: "John Doe" };
// sendSmtpEmail.headers = { "Some-Custom-Name": "unique-id-1234" };
// sendSmtpEmail.params = { parameter: "My param value", subject: "New Subject" };
