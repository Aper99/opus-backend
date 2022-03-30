const sistemaService = require('../services/sistemas/sistema.service');

const list = async (req, res) => {
  const sistemas = await sistemaService.list(req.query.q);
  res.send({
    success: true,
    sistemas,
  });
};

const getById = async (req, res) => {
  const sistema = await sistemaService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['sistema'] = sistema;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const sistema = await sistemaService.create(req.body);

  res.status(202).send({
    success: true,
    sistema,
  });
};

const update = async (req, res) => {
  const sistema = await sistemaService.update(req.body);

  res.status(202).send({
    success: true,
    sistema,
  });
};

const remove = async (req, res) => {
  const booleanValue = await sistemaService.remove(req.params.id);

  res.status(202).send({
    success: booleanValue,
  });
};

module.exports = {list, getById, create, update, remove};
