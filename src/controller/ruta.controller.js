const rutaService = require('../services/rutas/ruta.service');

const list = async (req, res) => {
  const rutas = await rutaService.list(req.query.q);
  res.send({
    success: true,
    rutas,
  });
};

const listGroup = async (req, res) => {
  const rutas = await rutaService.listGroup(req.query.q);
  res.send({
    success: true,
    rutas,
  });
};

const getById = async (req, res) => {
  const ruta = await rutaService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['ruta'] = ruta;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const ruta = await rutaService.create(req.body);

  res.status(202).send({
    success: true,
    ruta,
  });
};

const update = async (req, res) => {
  const ruta = await rutaService.update(req.body);

  res.status(202).send({
    success: true,
    ruta,
  });
};

const remove = async (req, res) => {
  const booleanValue = await rutaService.remove(req.params.id);

  res.status(202).send({
    success: booleanValue,
  });
};

module.exports = {list, listGroup, getById, create, update, remove};
