const clienteService = require('../services/clientes/cliente.service');

const list = async (req, res) => {
  const clientes = await clienteService.list(req.query.q);
  res.send({
    success: true,
    clientes,
  });
};

const listFilter = async (req, res) => {
  const clientes = await clienteService.listFilter(req.query.q);
  res.send({
    success: true,
    clientes,
  });
};

const getById = async (req, res) => {
  const cliente = await clienteService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['cliente'] = cliente;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const cliente = await clienteService.create(req.body);

  res.status(202).send({
    success: true,
    cliente,
  });
};

const update = async (req, res) => {
  const cliente = await clienteService.update(req.body);

  res.status(202).send({
    success: true,
    cliente,
  });
};

const remove = async (req, res) => {
  const booleanValue = await clienteService.remove(req.params.id);

  res.status(202).send({
    success: booleanValue,
  });
};

module.exports = {list, getById, create, update, remove, listFilter};
