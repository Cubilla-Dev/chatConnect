const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config();


//falta la variables .env
const createToken = (timeExpired, data=null) => {
    try{
        return jwt.sign(data, process.env.JWT_SECRET, {expiresIn: timeExpired});
    }catch(error){
        throw new Error('error createToken');
    }
};

module.exports = createToken;
