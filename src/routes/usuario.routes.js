const express = require('express');
const router = new express.Router();
const usuarioController = require('../controller/usuario.controller');

router.get('/', usuarioController.list);
router.get('/find/:id', usuarioController.getById);
router.post('/create', usuarioController.create);
router.put('/update', usuarioController.update);
router.delete('/remove/:id', usuarioController.remove);

module.exports = router;
