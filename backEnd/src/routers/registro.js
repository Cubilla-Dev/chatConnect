const expres = require('express')
const router = expres.Router()
const autUser = require('../controllers/auntenticacionController')

router.post('/registro',autUser.registro);

module.exports = router;
