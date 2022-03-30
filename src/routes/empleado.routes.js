const express = require('express');
const router = new express.Router();
const empleadoController = require('../controller/empleado.controller');

router.get('/', empleadoController.list);
router.get('/find/:id', empleadoController.getById);
router.post('/create', empleadoController.create);
router.put('/update', empleadoController.update);
router.delete('/remove/:id', empleadoController.remove);

module.exports = router;
