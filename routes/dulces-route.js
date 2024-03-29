/*
    Ruta: /dulces
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');

const { getDulces, getDulce, crearDulce, actualizarDulce, borrarDulce, crearContieneDulce, dulcesMasVendidos } = require('../controllers/dulces-controller');

const router = Router();

router.get('/masVendidos', dulcesMasVendidos);

router.get('/', getDulces);

router.get('/:id', getDulce);

router.post('/contieneDulce',   crearContieneDulce);

router.post('/', [
    check('tipo', 'El tipo es obligatorio').not().isEmpty(),
    check('name', 'El nombre es obligatorio').not().isEmpty(),
    validarCampos
    ],
    crearDulce
);

router.put('/:id', actualizarDulce
);

router.delete('/:id', borrarDulce);


module.exports = router;