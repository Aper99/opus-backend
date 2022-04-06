const empleadoService = require('../services/empleados/empleado.service');

const list = async (req, res) => {
  const empleados = await empleadoService.list(req.query.q);
  res.send({
    success: true,
    empleados,
  });
};

const getById = async (req, res) => {
  const empleado = await empleadoService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['empleado'] = empleado;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const empleado = await empleadoService.create(req.body);

  res.status(202).send({
    success: true,
    empleado,
  });
};

const update = async (req, res) => {
  const empleado = await empleadoService.update(req.body);

  res.status(202).send({
    success: true,
    empleado,
  });
};

const remove = async (req, res) => {
  try {
    const booleanValue = await empleadoService.remove(req.params.id);
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

module.exports = {list, getById, create, update, remove};
