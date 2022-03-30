const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const ClienteModel = sequelize.define('Cliente', {
  // Model attributes are defined here
  cli_codigo: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  cli_nombre: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  cli_rucci: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  cli_telefono: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  cli_email: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  cli_direccion: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  cli_codrut: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  tableName: 'cliente',
  timestamps: false,
});

module.exports = {
  ClienteModel,
};
