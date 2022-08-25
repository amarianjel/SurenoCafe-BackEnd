/*
    Ruta: /pedido
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { getPedidos, crearPedido, borrarPedido } = require('../controllers/pedido-controller');
const { validarJWT } = require('../middlewares/validar-jwt');

const router = Router();

router.get('/', getPedidos);

router.post('/', 
    [
        check('fechaPedido', 'La Fecha del Pedido es obligatorio').not().isEmpty(),
        check('fechaAgendada', 'La Fecha del Pedido es obligatorio').not().isEmpty(),
        check('hora', 'La Fecha del Pedido es obligatorio').not().isEmpty(),
        check('local', 'La Fecha del Pedido es obligatorio').not().isEmpty(),

        validarCampos
    ],
    crearPedido
);

router.delete('/:id', borrarPedido);


module.exports = router;