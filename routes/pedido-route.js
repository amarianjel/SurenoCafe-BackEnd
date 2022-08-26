/*
    Ruta: /pedido
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

const { getPedidos, crearPedido, borrarPedido,getHistorialPedidosDulces,getHistorialPedidosSalados } = require('../controllers/pedido-controller');
const { validarJWT } = require('../middlewares/validar-jwt');

const router = Router();

router.get('/', getPedidos);

router.get('/historialSalados', getHistorialPedidosSalados);
router.get('/historialDulces', getHistorialPedidosDulces);

router.post('/',crearPedido);

router.delete('/:id', borrarPedido);


module.exports = router;