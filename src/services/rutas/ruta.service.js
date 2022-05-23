/* eslint-disable max-len */
const {RutaModel} = require('../../models/ruta.model');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const rutaModelResult = await RutaModel.findAll({order: ['rut_codigo']});

  const rutaArray = [];

  rutaModelResult.forEach((ruta) =>
    rutaArray.push(ruta.dataValues),
  );

  return rutaArray;
};

const listGroup = async (query, pageStart = 1, pageLimit = 10) => {
  const rutaModelResult = await RutaModel.findAll({include: [{all: true}], order: ['rut_codigo']});

  const rutaArray = [];

  rutaModelResult.forEach((ruta) =>
    rutaArray.push(ruta.dataValues),
  );

  return rutaArray;
};

const getById = async (codigo) => {
  const rutaModelResult = await RutaModel.findByPk(codigo);

  if (rutaModelResult) {
    return rutaModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const rutaModelResult = await RutaModel.create(data);

  if (rutaModelResult) {
    return rutaModelResult.dataValues;
  } else {
    return null;
  }
};

const update = async (data) => {
  const rutaModelCount = await RutaModel.update(data, {
    where: {
      rut_codigo: data.rut_codigo,
    },
  });

  if (rutaModelCount > 0) {
    const rutaModelResult = await RutaModel.findByPk(data.rut_codigo);
    return rutaModelResult.dataValues;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const rutaModelCount = await RutaModel.destroy({
    where: {
      rut_codigo: codigo,
    },
  });

  if (rutaModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {list, listGroup, getById, create, update, remove};
