const {TareaModel} = require('../../models/tarea.model');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const tareaModelResult = await TareaModel.findAll();

  const tareaArray = [];

  tareaModelResult.forEach((tarea) =>
    tareaArray.push(tarea.dataValues),
  );

  return tareaArray;
};

const getById = async (codigo) => {
  const tareaModelResult = await TareaModel.findByPk(codigo);

  if (tareaModelResult) {
    return tareaModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const tareaModelResult = await TareaModel.create(data);

  if (tareaModelResult) {
    return tareaModelResult.dataValues;
  } else {
    return null;
  }
};

const update = async (data) => {
  const tareaModelCount = await TareaModel.update(data, {
    where: {
      tra_numero: data.tra_numero,
    },
  });

  if (tareaModelCount > 0) {
    const tareaModelResult = await TareaModel.findByPk(data.tra_numero);
    return tareaModelResult.dataValues;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const tareaModelCount = await TareaModel.destroy({
    where: {
      tra_numero: codigo,
    },
  });

  if (tareaModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {list, getById, create, update, remove};
