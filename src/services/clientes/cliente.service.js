const {ClienteModel} = require('../../models/cliente.model');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const clienteModelResult = await ClienteModel.findAll();

  const clienteArray = [];

  clienteModelResult.forEach((cliente) =>
    clienteArray.push(cliente.dataValues),
  );

  return clienteArray;
};

const getById = async (codigo) => {
  const clienteModelResult = await ClienteModel.findByPk(codigo);

  if (clienteModelResult) {
    return clienteModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const clienteModelResult = await ClienteModel.create(data);

  if (clienteModelResult) {
    return clienteModelResult.dataValues;
  } else {
    return null;
  }
};

const update = async (data) => {
  const clienteModelCount = await ClienteModel.update(data, {
    where: {
      cli_codigo: data.cli_codigo,
    },
  });

  if (clienteModelCount > 0) {
    const clienteModelResult = await ClienteModel.findByPk(data.cli_codigo);
    return clienteModelResult.dataValues;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const clienteModelCount = await ClienteModel.destroy({
    where: {
      cli_codigo: codigo,
    },
  });

  if (clienteModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {list, getById, create, update, remove};
