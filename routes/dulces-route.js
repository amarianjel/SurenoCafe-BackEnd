/*
    Ruta: /dulces
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');

const { getDulces, getDulce, crearDulce, actualizarDulce, borrarDulce } = require('../controllers/dulces-controller');

const router = Router();


router.get('/', getDulces);

router.get('/:id', getDulce);

router.post('/', [
    check('tipo', 'El tipo es obligatorio').not().isEmpty(),
    check('name', 'El nombre es obligatorio').not().isEmpty(),
    validarCampos
    ],
    crearDulce
);

router.put('/:id',/*[
    check('name', 'El nombre es obligatorio para no perderse').not().isEmpty(),
    validarCampos
    ],*/
    actualizarDulce
);

router.delete('/:id', borrarDulce);


module.exports = router;