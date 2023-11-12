const GetUser = require('../models/user')
const bcrypt = require('bcrypt')
const createToken = require('../util/createToken')
const dotenv = require('dotenv')
const { where, Sequelize } = require('sequelize')
dotenv.config()

const autUser = {
    async login(req, res){
        const { email, password } = req.body;
        try{
            //?verificamos si existe el correo
            const existingUser = await GetUser.findOne({ where: { email: email } });
            const passHash = bcrypt.compare(password, existingUser.passHash)
            if(!passHash){
                return res
                    .status(401)
                    .send.json({message: 'Contraseña incorrecta'})
            }
            const tokenJWT = createToken('2', {_id: existingUser.id_user})

            res
                .status(200)
                .send({
                    message: 'Inicio de sesion exitosa',
                    tokenJWT,
                    userData: existingUser
                })
        }catch{
            res
                .status(409)
                .send({message: 'El usuario no puedo iniciar sesion'})
        }
    },

    async register(req, res){
        try{
            const {name, lastname, email, password, verifiPassword } = req.body;
            if(password !== verifiPassword){
                return res
                    .status(400) 
                    .send({message: 'No coinciden las contraseñas'})
            }
            console.log(`datos recibidos de from register ${name} ${lastname}`)
            const existingUser = await GetUser.findOne(
                {
                    where: {
                        email: email
                    }
                }); //pasar el parametro
            if(existingUser){
                return res
                    .status(400)
                    .send({message: `ya existe un usuario con ese correo ${email}`})
            };

            let passHash = bcrypt.hashSync(password, 10);
            console.log(`la contrasenha con hash ${passHash}`)

            const newUser = new GetUser({name, lastname, email, passHash})
            //!Enviar un correo de confirmacion de registo
            await newUser.save()
            res 
                .status(200)
                .send({message: 'Usuario registrado correctamente'})
        }catch(error){
            console.error(error)
            if(error instanceof Sequelize.UniqueConstraintError){
                return res
                    .res.status(400).send({message: 'Ya existe un usuario con ese correo'})
            }
            res
                .status(500)
                .send({message: 'Error en el servidor'})
        }
    }
}


module.exports = autUser;