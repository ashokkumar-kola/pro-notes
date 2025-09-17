

// npm install nodemailer

// mailer.js

const nodemailer = require('nodemailer');

// ✅ Reusable transporter (Use environment variables in real projects)
const transporter = nodemailer.createTransport({
  service: 'gmail', // e.g., 'gmail', 'hotmail' or use `host`, `port` for custom
  auth: {
    user: 'your.email@gmail.com',
    pass: 'your_app_password'  // Use App Password or ENV variable
  }
});

// ✅ Send email function
async function sendEmail(to, subject, htmlContent) {
  try {
    const mailOptions = {
      from: '"Your Name" <your.email@gmail.com>',
      to, // Can be a string or array of recipients
      subject,
      html: htmlContent
    };

    const info = await transporter.sendMail(mailOptions);
    console.log('✅ Email sent:', info.messageId);
    return info;
  } catch (error) {
    console.error('❌ Error sending email:', error);
    throw error;
  }
}

module.exports = sendEmail;











// index.js

const sendEmail = require('./mailer');

sendEmail(
  'recipient@example.com',
  'Welcome to our service!',
  '<h1>Hello!</h1><p>Thanks for signing up.</p>'
);
        

