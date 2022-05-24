const usersService = require('../services/users/users.service');

const list = async (req, res) => {
  const sistemas = await usersService.list(req.query.q);
  res.send({
    success: true,
    sistemas,
  });
};

const getById = async (req, res) => {
  const sistema = await usersService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['sistema'] = sistema;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const sistema = await usersService.create(req.body);

  res.status(202).send({
    success: true,
    sistema,
  });
};

const update = async (req, res) => {
  const sistema = await usersService.update(req.body);

  res.status(202).send({
    success: true,
    sistema,
  });
};

const remove = async (req, res) => {
  try {
    const booleanValue = await usersService.remove(req.params.id);
    res.status(202).send({
      success: booleanValue,
    });
  } catch (error) {
    res.status(200).send({
      success: false,
      error: error.parent.code,
    });
  }
};

const login = async (req, res) => {
  try {
    const user = await usersService.login(req.body);

    res.status(200).send({
      success: true,
      token: user.token,
    });
  } catch (error) {
    res.status(400).send({
      success: false,
      error: error.message,
    });
  }
};

const logout = async (req, res) => {
  await usersService.logout(req.usuarioId);

  res.status(202).send({
    success: true,
  });
};
module.exports = {list, getById, create, update, remove, login, logout};
