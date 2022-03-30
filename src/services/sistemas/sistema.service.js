const {SistemaModel} = require('../../models/sistema.model');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const sistemaModelResult = await SistemaModel.findAll();

  const sistemaArray = [];

  sistemaModelResult.forEach((sistema) =>
    sistemaArray.push(sistema.dataValues),
  );

  return sistemaArray;
};

const getById = async (codigo) => {
  const sistemaModelResult = await SistemaModel.findByPk(codigo);

  if (sistemaModelResult) {
    return sistemaModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const sistemaModelResult = await SistemaModel.create(data);

  if (sistemaModelResult) {
    return sistemaModelResult.dataValues;
  } else {
    return null;
  }
};

const update = async (data) => {
  const sistemaModelCount = await SistemaModel.update(data, {
    where: {
      sis_codigo: data.sis_codigo,
    },
  });

  if (sistemaModelCount > 0) {
    const sistemaModelResult = await SistemaModel.findByPk(data.sis_codigo);
    return sistemaModelResult.dataValues;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const sistemaModelCount = await SistemaModel.destroy({
    where: {
      sis_codigo: codigo,
    },
  });

  if (sistemaModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {list, getById, create, update, remove};
