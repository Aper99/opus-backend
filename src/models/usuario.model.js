/* eslint-disable new-cap */
const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const UsuarioModel = sequelize.define('Users', {
  // Model attributes are defined here
  id: {
    autoIncrement: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  passwd: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  token: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
}, {
  tableName: 'users',
  timestamps: false,
});

module.exports = {
  UsuarioModel,
};
