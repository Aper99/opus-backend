const express = require('express');
const router = new express.Router();
const rutaController = require('../controller/ruta.controller');

router.get('/', rutaController.list);
router.get('/group', rutaController.listGroup);
router.get('/find/:id', rutaController.getById);
router.post('/create', rutaController.create);
router.put('/update', rutaController.update);
router.delete('/remove/:id', rutaController.remove);

module.exports = router;
