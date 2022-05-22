const tareaService = require('../services/tareas/tarea.service');

const list = async (req, res) => {
  const tareas = await tareaService.list(req.query);
  res.send({
    success: true,
    tareas,
  });
};

const getById = async (req, res) => {
  const tarea = await tareaService.getById(req.params.id);

  const jsonResultado = req.query;
  jsonResultado['success'] = true;
  jsonResultado['tarea'] = tarea;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const tarea = await tareaService.create(req.body);

  res.status(202).send({
    success: true,
    tarea,
  });
};

const update = async (req, res) => {
  try {
    const tarea = await tareaService.update(req.body);

    res.status(202).send({
      success: true,
      tarea,
    });
  } catch (error) {
    res.status(400).send({
      success: false,
      error: {code: error.parent.code, message: error.parent.detail},
    });
  }
};

const remove = async (req, res) => {
  const booleanValue = await tareaService.remove(req.params.id);

  res.status(202).send({
    success: booleanValue,
  });
};

module.exports = {list, getById, create, update, remove};
