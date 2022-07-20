/*
    Ruta: /dulces
*/
const { Router } = require('express');
const { check } = require('express-validator');

const { getDulces, getDulce, crearDulce } = require('../controllers/dulce-controller');

const router = Router();


router.get('/', getDulces);

router.get('/:id', getDulce);

router.post('/', [
    check('tipo', 'El tipo es obligatorio').not().isEmpty(),
    check('name', 'El nombre es obligatorio').not().isEmpty(),
    ],
    crearDulce
);


module.exports = router;