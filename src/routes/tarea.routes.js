const express = require('express');
const router = new express.Router();
const tareaController = require('../controller/tarea.controller');

router.get('/', tareaController.list);
router.get('/find/:id', tareaController.getById);
router.post('/create', tareaController.create);
router.put('/update', tareaController.update);
router.delete('/remove/:id', tareaController.remove);

module.exports = router;
