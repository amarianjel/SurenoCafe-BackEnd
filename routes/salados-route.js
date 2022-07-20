/*
    Ruta: /salados
*/
const { Router } = require('express');
const { check } = require('express-validator');
const {validarCampos } = require('../middlewares/validar-campos');

const { getSalados, getSalado, crearSalado, actualizarSalado, borrarSalado } = require('../controllers/salados-controller');

const router = Router();


router.get('/', getSalados);

router.get('/:id', getSalado);

router.post('/', [
    check('tipo', 'El tipo es obligatorio').not().isEmpty(),
    check('name', 'El nombre es obligatorio').not().isEmpty(),
    validarCampos
    ],
    crearSalado
);

router.put('/:id',[
    check('name', 'El nombre es obligatorio para no perderse').not().isEmpty(),
    validarCampos
    ],
    actualizarSalado
);

router.delete('/:id', borrarSalado);


module.exports = router;