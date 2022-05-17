const {sequelize} = require('../services/bd.service');

const authorization = async (request, response, next) => {
  next();
  return;
  const token = request.headers['authorization'];

  let usersResult = await sequelize.query(
      `SELECT id, name, token
                                      FROM users
                                      WHERE token = :t`,
      {replacements: {t: token}},
  );

  usersResult = usersResult && usersResult[0] ? usersResult[0] : [];

  if (usersResult && usersResult.length > 0) {
    request.usuarioId = usersResult[0].id;
    next();
  } else {
    response.send({
      success: false,
      error: 'No se pudo autentificar',
    });
  }
};

module.exports = {authorization};
