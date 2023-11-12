const express = require('express')
const router = express.Router()
const autUser = require('../controllers/auntenticacionController')

router.post('/login',autUser.login);
router.post('/register',autUser.register);

module.exports = router;
