/* eslint-disable max-len */
const express = require('express');
const router = new express.Router();
const usersController = require('../controller/users.controller');
const authorizationMiddleware = require('../middleware/authorization.middleware');

router.get('/', authorizationMiddleware.authorization, usersController.list);
router.get('/find/:id', authorizationMiddleware.authorization, usersController.getById);
router.post('/create', authorizationMiddleware.authorization, usersController.create);
router.put('/update', authorizationMiddleware.authorization, usersController.update);
router.delete('/remove/:id', authorizationMiddleware.authorization, usersController.remove);
router.post('/login', usersController.login);
router.post('/logout', authorizationMiddleware.authorization, usersController.logout);

module.exports = router;
