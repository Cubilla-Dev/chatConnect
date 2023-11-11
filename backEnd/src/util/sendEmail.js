const { config } = require('../config/config')
const { transport } = require('../config/emailTrasport')
const dotenv = require('dotenv')
dotenv.config()

async function sendEmail(res, toEmail, emailSubject, emailBody){
    try{
        const mailOptions = {
            from: config[process.env.NODE_ENV].email,
            to: toEmail,
            subject: emailSubject,
            html: emailBody
        }

        await transport.sendEmail(mailOptions)
        return
    }catch(error){
        res
            .status(400)
            .json({message: 'Error en el envio del correo'})
    }
}

module.exports = sendEmail;