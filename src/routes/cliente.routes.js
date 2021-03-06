const express = require('express');
const router = new express.Router();
const clienteController = require('../controller/cliente.controller');

router.get('/', clienteController.list);
router.get('/filter', clienteController.listFilter);
router.get('/find/:id', clienteController.getById);
router.post('/create', clienteController.create);
router.put('/update', clienteController.update);
router.delete('/remove/:id', clienteController.remove);

module.exports = router;
