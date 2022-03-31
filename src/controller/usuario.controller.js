const usuarioService = require('../services/usuarios/usuario.service');

const list = async (req, res) => {
  const usuarios = await usuarioService.list(req.query.q);
  res.send({
    success: true,
    usuarios,
  });
};

const getById = async (req, res) => {
  const usuario = await usuarioService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['usuario'] = usuario;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const usuario = await usuarioService.create(req.body);

  res.status(202).send({
    success: true,
    usuario,
  });
};

const update = async (req, res) => {
  const usuario = await usuarioService.update(req.body);

  res.status(202).send({
    success: true,
    usuario,
  });
};

const remove = async (req, res) => {
  const booleanValue = await usuarioService.remove(req.params.id);

  res.status(202).send({
    success: booleanValue,
  });
};

module.exports = {list, getById, create, update, remove};
