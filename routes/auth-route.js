/*
    Ruta: /login
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { getAuths, crearAuth, login, actualizarImagenAuth, actualizarAuth } = require('../controllers/auth-controller');
const { validarJWT } = require('../middlewares/validar-jwt');

const router = Router();

router.get('/', getAuths);

router.post('/', 
    [
        check('email', 'El email es obligatorio').isEmail(),
        check('password', ' La password es obligatoria').not().isEmpty(),
        validarCampos
    ],
    crearAuth
);

router.post('/login', 
    [
        check('email', 'El email es obligatorio').isEmail(),
        check('password', ' La password es obligatoria').not().isEmpty(),
        validarCampos
    ],
    login
);

router.put('/:id', actualizarAuth);

//router.put('/img/:id', actualizarImagenAuth);

module.exports = router;