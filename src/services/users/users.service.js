const {SistemaModel} = require('../../models/sistema.model');
const {sequelize} = require('../bd.service');
const jwt = require('jsonwebtoken');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const sistemaModelResult = await SistemaModel.findAll({
    order: ['sis_codigo'],
  });

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

const login = async (data) => {
  let usersResult = await sequelize.query(
      `SELECT id, name, token
                                        FROM users
                                        WHERE name = :n
                                        AND passwd = :p LIMIT 1`,
      {replacements: {n: data.username, p: data.password}},
  );

  usersResult = usersResult && usersResult[0] ? usersResult[0] : [];

  if (usersResult && usersResult.length > 0) {
    if (usersResult[0].token && usersResult[0].token != '') {
      return {
        token: usersResult[0].token,
      };
    } else {
      const payload = {
        username: data.username,
        id: usersResult[0].id,
      };

      const token = jwt.sign(payload, 'icde');

      await sequelize.query(
          `UPDATE users 
            SET token = :t
            WHERE id = :i`,
          {replacements: {t: token, i: payload.id}},
      );

      return {token};
    }
  } else {
    throw new Error('datos de username o password inválidos');
  }
};

const logout = async (usuarioId) => {
  await sequelize.query(
      `UPDATE users 
      SET token = null
      WHERE id = :i`,
      {replacements: {i: usuarioId}},
  );
};

module.exports = {list, getById, create, update, remove, login, logout};
