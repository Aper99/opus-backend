const express = require('express');
const router = new express.Router();
const sistemaController = require('../controller/sistema.controller');

router.get('/', sistemaController.list);
router.get('/find/:id', sistemaController.getById);
router.post('/create', sistemaController.create);
router.put('/update', sistemaController.update);
router.delete('/remove/:id', sistemaController.remove);

module.exports = router;
