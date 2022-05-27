/* eslint-disable max-len */
const {UsuarioModel} = require('../../models/usuario.model');
const {sequelize} = require('../bd.service');
const jwt = require('jsonwebtoken');

const list = async (query, pageStart = 1, pageLimit = 10) => {
  const usuarioModelResult = await UsuarioModel.findAll({
    order: ['id'],
    attributes: ['id', 'name', 'email'],
  });

  const usuarioArray = [];

  usuarioModelResult.forEach((usuario) =>
    usuarioArray.push(usuario.dataValues),
  );

  return usuarioArray;
};

const getById = async (codigo) => {
  const usuarioModelResult = await UsuarioModel.findByPk(codigo);

  if (usuarioModelResult) {
    return usuarioModelResult.dataValues;
  } else {
    return null;
  }
};

const getByEmail = async (email) => {
  const usuarioModelResult = await UsuarioModel.findOne({where: {
    email: email,
  }});

  if (usuarioModelResult) {
    return usuarioModelResult.dataValues;
  } else {
    return null;
  }
};

const create = async (data) => {
  const usuarioModelResult = await UsuarioModel.create(data);

  if (usuarioModelResult) {
    // eslint-disable-next-line no-unused-vars
    const {passws, token, ...newUser} = usuarioModelResult.dataValues;
    return newUser;
  } else {
    return null;
  }
};

const update = async (data) => {
  const usuarioModelCount = await UsuarioModel.update(data, {
    where: {
      id: data.id,
    },
  });

  if (usuarioModelCount > 0) {
    const usuarioModelResult = await UsuarioModel.findByPk(data.id);
    // eslint-disable-next-line no-unused-vars
    const {passws, token, ...newUser} = usuarioModelResult.dataValues;
    return newUser;
  } else {
    return null;
  }
};

const remove = async (codigo) => {
  const usuarioModelCount = await UsuarioModel.destroy({
    where: {
      id: codigo,
    },
  });

  if (usuarioModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

const login = async (data) => {
  let usersResult = await sequelize.query(
      `SELECT id, name, email, token
                                        FROM users
                                        WHERE email = :n
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
        email: data.username,
        name: usersResult[0].name,
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

module.exports = {list, getById, getByEmail, create, update, remove, login, logout};
