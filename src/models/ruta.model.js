const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const RutaModel = sequelize.define('Ruta', {
  // Model attributes are defined here
  rut_codigo: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  rut_descripcion: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  tableName: 'ruta',
  timestamps: false,
});

module.exports = {
  RutaModel,
};
