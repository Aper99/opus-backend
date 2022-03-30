const {EmpleadoModel} = require('../../models/empleado.model');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const empleadoModelResult = await EmpleadoModel.findAll();

  const empleadoArray = [];

  empleadoModelResult.forEach((empleado) =>
    empleadoArray.push(empleado.dataValues),
  );

  return empleadoArray;
};

const getById = async (codigo) => {
  const empleadoModelResult = await EmpleadoModel.findByPk(codigo);

  if (empleadoModelResult) {
    return empleadoModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const empleadoModelResult = await EmpleadoModel.create(data);

  if (empleadoModelResult) {
    return empleadoModelResult.dataValues;
  } else {
    return null;
  }
};

const update = async (data) => {
  const empleadoModelCount = await EmpleadoModel.update(data, {
    where: {
      emp_codigo: data.emp_codigo,
    },
  });

  if (empleadoModelCount > 0) {
    const empleadoModelResult = await EmpleadoModel.findByPk(data.emp_codigo);
    return empleadoModelResult.dataValues;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const empleadoModelCount = await EmpleadoModel.destroy({
    where: {
      emp_codigo: codigo,
    },
  });

  if (empleadoModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {list, getById, create, update, remove};
