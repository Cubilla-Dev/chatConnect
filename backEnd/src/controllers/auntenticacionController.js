const GetUser = require('../models/user')
const bcrypt = require('bcrypt')
const createToken = require('../util/createToken')
const dotenv = require('dotenv')
dotenv.config()

const autUser = class {
    async login(req, res){
        const { email, password } = req.body;
        try{
            const user = await GetUser.findOne({email});
            const passHash = bcrypt.compare(password, user.passHash)
            if(!passHash){
                return res
                    .status(401)
                    .send.json({message: 'Contraseña incorrecta'})
            }
            const tokenJWT = createToken('2', {_id: user.id_user})

            res
                .status(200)
                .send({
                    message: 'Inicio de sesion exitosa',
                    tokenJWT,
                    userData: user
                })
        }catch{
            res
                .status(409)
                .send({message: 'El usuario no puedo iniciar sesion'})
        }
    }

    async register(req, res){
        try{
            const {name, lastname, email, password, verifiPassword } = req.body;
            if(password !== verifiPassword){
                return res
                    .status(400) //cambiar el 400 tiene que ser otro
                    .send({message: 'No coinciden las contraseñas'})
            }
            const user = await GetUser.findOne({email}); //pasar el parametro
            if(user){
                return res
                    .status(409)
                    .send({message: 'ya existe un usuario con ese correo'})
            };

            let passHash = bcrypt.hashSync(password, 10);
            const newUser = new GetUser({name, lastname, email, passHash})
            //Enviar un correo de confirmacion de registo
            await newUser.save()
            res 
                .status(200)
                .send({message: 'Usuario registrado correctamente'})
        }catch{
            res
                .status(400)
                .send({message: 'El usuario no puedo registrar'})
        }
    }
}


module.exports = autUser;