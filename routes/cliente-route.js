/*
    Ruta: /cliente
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { getClientes, crearCliente, login, actualizarCliente, borrarCliente } = require('../controllers/cliente-controller');
const { validarJWT } = require('../middlewares/validar-jwt');

const router = Router();

router.get('/', getClientes);

router.post('/', 
    [
        check('email', 'El email es obligatorio').isEmail(),
        check('password', ' La password es obligatoria').not().isEmpty(),
        validarCampos
    ],
    crearCliente
);

router.post('/login', 
    [
        check('email', 'El email es obligatorio').isEmail(),
        check('password', ' La password es obligatoria').not().isEmpty(),
        validarCampos
    ],
    login
);

router.put('/:email', actualizarCliente);

router.delete('/:email', borrarCliente);


module.exports = router;