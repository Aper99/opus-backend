const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const SistemaModel = sequelize.define('Sistema', {
  // Model attributes are defined here
  sis_codigo: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  sis_descripcion: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  tableName: 'sistema',
  timestamps: false,
});

module.exports = {
  SistemaModel,
};
