const usersService = require('../services/users/users.service');

const list = async (req, res) => {
  const usuarios = await usersService.list(req.query.q);
  res.send({
    success: true,
    usuarios,
  });
};

const getById = async (req, res) => {
  const usuario = await usersService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['usuario'] = usuario;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  // verifica primero si el email ya existe en otro usuario
  const user = await usersService.getByEmail(req.body.email);
  if (user) {
    res.status(200).send({
      success: false,
      error: 'Usuario ya existe',
    });
    return;
  }

  const usuario = await usersService.create(req.body);

  res.status(202).send({
    success: true,
    usuario,
  });
};

const update = async (req, res) => {
  const usuario = await usersService.update(req.body);

  res.status(202).send({
    success: true,
    usuario,
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
